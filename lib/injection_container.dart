import 'package:get_it/get_it.dart';
import 'data/datasources/scan_remote_datasource.dart';
import 'data/repositories/scan_repository_impl.dart';
import 'domain/repositories/scan_repository.dart';
import 'domain/usecases/get_scans.dart';
import 'presentation/bloc/scan_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Presentation
  sl.registerFactory<ScanBloc>(() => ScanBloc(getScansUC: sl()));

  // Domain
  sl.registerLazySingleton(() => GetScans(sl<ScanRepository>()));

  // Data
  sl.registerLazySingleton<ScanRepository>(
      () => ScanRepositoryImpl(dataSource: sl<ScanRemoteDataSource>()));

  // Data source
  sl.registerLazySingleton<ScanRemoteDataSource>(
      () => ScanRemoteDataSourceImpl());
}
