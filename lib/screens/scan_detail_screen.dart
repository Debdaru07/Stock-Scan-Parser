import 'package:flutter/material.dart';
import '../../domain/entities/scan_entity.dart';
import 'variable_values_screen.dart';

class ScanDetailScreen extends StatelessWidget {
  final ScanEntity scan;

  const ScanDetailScreen({super.key, required this.scan});

  List<InlineSpan> buildVariableText(
    BuildContext context,
    String text,
    Map<String, VariableEntity> vars,
  ) {
    final pattern = RegExp(r'(\$\d+)');

    final replaced = text.splitMapJoin(
      pattern,
      onMatch: (m) => '|||${m[0]}|||',
      onNonMatch: (n) => n,
    );

    final parts = replaced.split('|||');

    return parts.map<InlineSpan>((p) {
      if (p.startsWith(r'$') && vars.containsKey(p)) {
        final spec = vars[p]!;
        return WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      VariableValuesScreen(variableKey: p, spec: spec),
                ),
              );
            },
            child: Text(
              p,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 1.2,
              ),
            ),
          ),
        );
      } else {
        return TextSpan(
          text: p,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            height: 1.2,
          ),
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07161A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF07161A),
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: Text(
          scan.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xFF1982A1),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scan.name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      scan.tag,
                      style: TextStyle(
                        fontSize: 14,
                        color: scan.color == 'red'
                            ? Colors.redAccent
                            : Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...scan.criteria.asMap().entries.map((entry) {
                final i = entry.key;
                final c = entry.value;

                if (c.type == "plain_text") {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        if (i < scan.criteria.length - 1 &&
                            scan.criteria[i + 1].type == "plain_text")
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              "and",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }

                final variableMap = c.variables ?? {};

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      children: buildVariableText(context, c.text, variableMap),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
