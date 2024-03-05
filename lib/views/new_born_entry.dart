import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_care_statistics/aggregates/new_born_sheet.dart';
import 'package:patient_care_statistics/providers/db.dart';
import 'package:patient_care_statistics/providers/new_born_sheets.dart';
import 'package:patient_care_statistics/providers/uuid.dart';
import 'package:patient_care_statistics/widgets/cool_button.dart';
import 'package:patient_care_statistics/widgets/custom_date_time_picker.dart';
import 'package:patient_care_statistics/widgets/custom_text_field.dart';
import 'package:patient_care_statistics/form_payloads/new_born_entry.dart';

import '../events/create_new_born_sheet.dart';
import '../routes.dart';

class NewBornEntryView extends ConsumerStatefulWidget {
  final NewBornSheet? newBornSheet;

  const NewBornEntryView({super.key, this.newBornSheet});

  @override
  ConsumerState<NewBornEntryView> createState() => _NewBornEntryViewState();
}

class _NewBornEntryViewState extends ConsumerState<NewBornEntryView> {
  NewBornEntry state = NewBornEntry(
    insertedAt: DateTime.now(),
    sectorCode: "",
    bedCode: "",
    entryDateTime: DateTime.now(),
    newBornName: "",
    birthDateTime: DateTime.now(),
    healthInsurance: "",
  );

  @override
  void initState() {
    if (widget.newBornSheet != null) {
      state = NewBornEntry.fromSheet(widget.newBornSheet!);
    }
    super.initState();
  }

  Future<void> _createNewBornSheet(NewBornEntry newBornEntry) async {
    final db = ref.watch(dbProvider);
    final uuid = ref.watch(uuidProvider);

    final recordId = await createNewBornSheet(newBornEntry, db!, uuid!);

    if (recordId > 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Entrada guardada'),
      ));
      ref.invalidate(newBornSheetsProvider);
      Navigator.pushNamed(context, newBornSheetsRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No se pudo guardar'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CoolButton(
            onPressed: () =>
                {Navigator.pushNamed(context, healthProfessionalRoute)},
            child: const Text("+ Profesional de salud"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Nuevo Ingreso",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "A-001",
              labelText: "Sector",
              updateValue: (text) =>
                  setState(() => state = state.copyWith(sectorCode: text)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "A-001",
              labelText: "Cama",
              updateValue: (text) =>
                  setState(() => state = state.copyWith(bedCode: text)),
            ),
            const SizedBox(height: 10),
            CustomDateTimePicker(
              currentValue: state.entryDateTime,
              title: "Fecha registro",
              updateValue: (value) =>
                  setState(() => state = state.copyWith(entryDateTime: value)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "Juan Pérez",
              labelText: "Nombre RN",
              updateValue: (text) =>
                  setState(() => state = state.copyWith(newBornName: text)),
            ),
            const SizedBox(height: 10),
            CustomDateTimePicker(
              currentValue: state.birthDateTime,
              title: "Fecha de parto",
              updateValue: (value) =>
                  setState(() => state = state.copyWith(birthDateTime: value)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "FONASA",
              labelText: "Previsión de salud",
              updateValue: (text) =>
                  setState(() => state = state.copyWith(healthInsurance: text)),
            ),
            const SizedBox(height: 10),
            CoolButton(
              child: const Text("Guardar"),
              onPressed: () async => await _createNewBornSheet(state),
            ),
          ],
        ),
      ),
    );
  }
}
