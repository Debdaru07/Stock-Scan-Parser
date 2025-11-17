import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/scan_bloc.dart';
import '../presentation/bloc/scan_state.dart';
import '../widgets/scan_card.dart';
import 'scan_detail_screen.dart';

class ScanListScreen extends StatelessWidget {
  const ScanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stock Scans")),
      body: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          if (state is ScanLoading || state is ScanInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ScanError) {
            return Center(child: Text(state.message));
          }
          if (state is ScanLoaded) {
            final scans = state.scans;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: scans.length,
              itemBuilder: (_, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScanDetailScreen(scan: scans[i]),
                      ),
                    );
                  },
                  child: ScanCard(scan: scans[i]),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
