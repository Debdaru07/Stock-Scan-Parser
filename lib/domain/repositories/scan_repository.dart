import '../entities/scan_entity.dart';

abstract class ScanRepository {
  Future<List<ScanEntity>> getScans();
}
