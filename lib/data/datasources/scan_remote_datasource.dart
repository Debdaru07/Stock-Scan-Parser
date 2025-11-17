import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/scan_model.dart';

abstract class ScanRemoteDataSource {
  Future<List<ScanModel>> getScans();
}

class ScanRemoteDataSourceImpl implements ScanRemoteDataSource {
  @override
  Future<List<ScanModel>> getScans() async {
    final uri =
        Uri.parse('http://coding-assignment.bombayrunning.com/data.json');
    final res = await http.get(uri);

    if (res.statusCode != 200) {
      throw Exception("Failed to load scans");
    }

    final List<dynamic> raw = jsonDecode(res.body);

    return raw.map((e) => ScanModel.fromJson(e)).toList();
  }
}
