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
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VariableValuesScreen(
                    variableKey: p,
                    spec: spec,
                  ),
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
          ),
        );
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scan.name),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Container(
            width: double.infinity,
            color: const Color(0xFF07161A),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header box (blue)
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
                          color: scan.color == 'red'
                              ? Colors.redAccent
                              : Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: scan.criteria.length,
                    itemBuilder: (_, i) {
                      final c = scan.criteria[i];

                      if (c.type == "plain_text") {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
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
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "and",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }

                      // VARIABLE TYPE
                      final variableMap = c.variables ?? {};

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                              children: buildVariableText(
                                  context, c.text, variableMap)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
