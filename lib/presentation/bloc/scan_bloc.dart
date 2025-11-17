import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_scans.dart';
import 'scan_event.dart';
import 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final GetScans getScansUC;

  ScanBloc({required this.getScansUC}) : super(ScanInitial()) {
    on<LoadScans>((event, emit) async {
      emit(ScanLoading());
      try {
        final list = await getScansUC();
        emit(ScanLoaded(list));
      } catch (e) {
        emit(ScanError(e.toString()));
      }
    });
  }
}
