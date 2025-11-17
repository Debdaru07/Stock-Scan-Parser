import '../../domain/entities/scan_entity.dart';

abstract class ScanState {}

class ScanInitial extends ScanState {}

class ScanLoading extends ScanState {}

class ScanLoaded extends ScanState {
  final List<ScanEntity> scans;
  ScanLoaded(this.scans);
}

class ScanError extends ScanState {
  final String message;
  ScanError(this.message);
}
