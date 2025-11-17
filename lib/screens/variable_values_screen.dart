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
        leading: BackButton(color: Colors.white),
        title: Text(
          "Values for $variableKey",
          style: const TextStyle(color: Colors.white),
        ),
      ),

      // 🔥 No padding, no centering, full width layout
      body: Container(
        width: double.infinity,
        color: const Color(0xFF07161A),
        child: isValueType ? buildValueList() : buildIndicatorDetails(),
      ),
    );
  }

  Widget buildValueList() {
    final values = spec.values ?? [];

    return ListView.separated(
      padding:
          const EdgeInsets.symmetric(vertical: 20), // 🔥 No horizontal padding
      itemCount: values.length,
      separatorBuilder: (_, __) =>
          const Divider(color: Colors.white24, height: 1),
      itemBuilder: (_, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16, horizontal: 0), // 🔥 No side padding
          child: Text(
            values[i].toString(),
            textAlign: TextAlign.left,
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
    return Padding(
      padding: const EdgeInsets.only(
          top: 30, left: 20, right: 20), // minimal padding like web
      child: Column(
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
      ),
    );
  }
}
