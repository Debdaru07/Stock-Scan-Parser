import 'package:flutter/material.dart';
import '../../domain/entities/scan_entity.dart';

class VariableValuesScreen extends StatelessWidget {
  final String variableKey;
  final VariableEntity spec;

  const VariableValuesScreen({
    super.key,
    required this.variableKey,
    required this.spec,
  });

  @override
  Widget build(BuildContext context) {
    final isValueType = spec.type == "value";

    return Scaffold(
      backgroundColor: const Color(0xFF07161A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF07161A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Values for $variableKey",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Container(
            padding: const EdgeInsets.all(18),
            child: isValueType ? buildValueList() : buildIndicatorDetails(),
          ),
        ),
      ),
    );
  }

  Widget buildValueList() {
    final values = spec.values ?? [];

    return ListView.separated(
      itemCount: values.length,
      separatorBuilder: (_, __) =>
          const Divider(color: Colors.white24, height: 1),
      itemBuilder: (_, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Text(
            values[i].toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }

  Widget buildIndicatorDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Indicator: ${spec.studyType}",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(height: 14),
        Text(
          "Parameter: ${spec.parameterName}",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(height: 20),
        Text("Min: ${spec.minValue}",
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        Text("Max: ${spec.maxValue}",
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        Text("Default: ${spec.defaultValue}",
            style: const TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}
