import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/new_born_sheet.dart';
import '../excel/writer.dart';
import '../providers/new_born_sheets.dart';
import '../routes.dart';
import '../widgets/cool_button.dart';

class NewBornSheetsView extends ConsumerWidget {
  const NewBornSheetsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoolButton(
              onPressed: () => Navigator.pushNamed(context, newBornEntryRoute),
              child: const Icon(Icons.baby_changing_station),
            ),
          ],
        ),
      ),
      appBar: AppBar(automaticallyImplyLeading: false),
      body: ref.watch(newBornSheetsProvider).when(
            data: (newBornSheets) {
              if (newBornSheets.isNotEmpty) {
                return SheetsLister(newBornSheets: newBornSheets);
              } else {
                return const Center(child: Text("No hay registros"));
              }
            },
            error: (e, s) {
              return const Center(
                child: Text("Error"),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}

class SheetsLister extends StatelessWidget {
  const SheetsLister({
    super.key,
    required this.newBornSheets,
  });

  final List<NewBornSheet> newBornSheets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: newBornSheets.length,
            itemBuilder: (context, index) {
              final newBornSheet = newBornSheets[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    newBornSheet.newBornName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          const Icon(Icons.favorite),
                          const SizedBox(width: 10),
                          Text(
                              "${newBornSheet.birthDateTime.format('d/m/Y')} - ${newBornSheet.lifeDays} días de vida"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.place),
                          const SizedBox(width: 10),
                          Text(newBornSheet.sectorCode),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.bed),
                          const SizedBox(width: 10),
                          Text(newBornSheet.bedCode),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => {
                    Navigator.pushNamed(context, newBornEntryRoute,
                        arguments: {"newBornSheet": newBornSheet})
                  },
                ),
              );
            },
          ),
        ),
        CoolButton(
          onPressed: () async {
            await writeExcel(newBornSheets);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Excel generado'),
              duration: Durations.medium4,
            ));
          },
          child: const Icon(Icons.download),
        ),
      ],
    );
  }
}
