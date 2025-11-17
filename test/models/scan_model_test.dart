import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/data/models/scan_model.dart';

void main() {
  test('ScanModel.fromJson should parse simple json', () {
    const jsonString = '''
    {
      "id": 1,
      "name": "Top gainers",
      "tag": "Intraday Bullish",
      "color": "green",
      "criteria": [
        {"type":"plain_text", "text":"Sort - %price change in descending order"}
      ]
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(jsonString);
    final model = ScanModel.fromJson(json);

    expect(model.id, 1);
    expect(model.name, "Top gainers");
    expect(model.tag, "Intraday Bullish");
    expect(model.color, "green");
    expect(model.criteria.length, 1);
    expect(model.criteria.first.type, "plain_text");
    expect(model.criteria.first.text, contains('Sort - %price change'));
  });
}
