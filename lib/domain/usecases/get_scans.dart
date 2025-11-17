import '../entities/scan_entity.dart';
import '../repositories/scan_repository.dart';

class GetScans {
  final ScanRepository repository;

  GetScans(this.repository);

  Future<List<ScanEntity>> call() async {
    return await repository.getScans();
  }
}
