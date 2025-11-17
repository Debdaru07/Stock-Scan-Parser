import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/domain/repositories/scan_repository.dart';
import 'package:stock_scan_parser/presentation/bloc/scan_bloc.dart';
import 'package:stock_scan_parser/presentation/bloc/scan_event.dart';
import 'package:stock_scan_parser/presentation/bloc/scan_state.dart';
import 'package:stock_scan_parser/domain/entities/scan_entity.dart';
import 'package:stock_scan_parser/domain/usecases/get_scans.dart';
import 'package:bloc_test/bloc_test.dart';

// A tiny fake repository via GetScans wrapper
class FakeGetScans extends GetScans {
  FakeGetScans() : super(_FakeRepo());
}

class _FakeRepo implements ScanRepository {
  Future<List<ScanEntity>> getScans() async {
    return [
      ScanEntity(
        id: 1,
        name: 'Test',
        tag: 'tag',
        color: 'green',
        criteria: [],
      )
    ];
  }
}

void main() {
  blocTest<ScanBloc, ScanState>(
    'emits [ScanLoading, ScanLoaded] when LoadScans is added',
    build: () => ScanBloc(getScansUC: FakeGetScans()),
    act: (bloc) => bloc.add(LoadScans()),
    expect: () => [
      isA<ScanLoading>(),
      isA<ScanLoaded>(),
    ],
  );
}
