import '../../domain/entities/scan_entity.dart';
import '../../domain/repositories/scan_repository.dart';
import '../datasources/scan_remote_datasource.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanRemoteDataSource dataSource;

  ScanRepositoryImpl({required this.dataSource});

  @override
  Future<List<ScanEntity>> getScans() async {
    return await dataSource.getScans();
  }
}
