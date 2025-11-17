import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/scan_bloc.dart';
import 'presentation/bloc/scan_event.dart';
import 'injection_container.dart' as di;
import 'screens/scan_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // register dependencies
  runApp(const StockScanApp());
}

class StockScanApp extends StatelessWidget {
  const StockScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scanBloc = di.sl<ScanBloc>(); // resolved from DI

    return BlocProvider<ScanBloc>(
      create: (_) => scanBloc..add(LoadScans()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stock Scan Parser',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScanListScreen(),
      ),
    );
  }
}
