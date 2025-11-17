import 'package:flutter/material.dart';
import '../../domain/entities/scan_entity.dart';

class ScanCard extends StatelessWidget {
  final ScanEntity scan;

  const ScanCard({super.key, required this.scan});

  Color getTagColor() {
    return scan.color.toLowerCase() == "red"
        ? Colors.redAccent
        : Colors.greenAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF07161A),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 10),
            child: Icon(Icons.circle, size: 8, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scan.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  scan.tag,
                  style: TextStyle(
                    fontSize: 14,
                    color: getTagColor(),
                  ),
                ),
                const SizedBox(height: 12),

                // dotted divider (simple version)
                Container(
                  height: 1,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white24,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
