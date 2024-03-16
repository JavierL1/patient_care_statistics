import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/health_professional.dart';
import '../aggregates/new_born_sheet.dart';
import '../events/create_new_born_sheet.dart';
import '../events/update_new_born_sheet_base_fields.dart';
import '../form_payloads/new_born_entry.dart';
import '../providers/db.dart';
import '../providers/health_professionals.dart';
import '../providers/new_born_sheets.dart';
import '../providers/uuid.dart';
import '../routes.dart';
import '../widgets/cool_button.dart';
import '../widgets/custom_date_time_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/health_professionals_selector.dart';

class NewBornEntryView extends ConsumerStatefulWidget {
  final NewBornSheet? newBornSheet;

  const NewBornEntryView({super.key, this.newBornSheet});

  @override
  ConsumerState<NewBornEntryView> createState() => _NewBornEntryViewState();
}

class _NewBornEntryViewState extends ConsumerState<NewBornEntryView> {
  NewBornEntry _state = NewBornEntry.initial();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();

    if (widget.newBornSheet != null) {
      _state = NewBornEntry.fromSheet(widget.newBornSheet!);
    }

    _controllers['sectorCode'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.sectorCode),
    );
    _controllers['bedCode'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.bedCode),
    );
    _controllers['newBornName'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.newBornName),
    );
    _controllers['healthInsurance'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.healthInsurance),
    );

    _controllers['sectorCode']!.addListener(
      () => setState(
        () => _state =
            _state.copyWith(sectorCode: _controllers['sectorCode']!.text),
      ),
    );
    _controllers['bedCode']!.addListener(
      () => setState(
        () => _state = _state.copyWith(bedCode: _controllers['bedCode']!.text),
      ),
    );
    _controllers['newBornName']!.addListener(
      () => setState(
        () => _state =
            _state.copyWith(newBornName: _controllers['newBornName']!.text),
      ),
    );
    _controllers['healthInsurance']!.addListener(
      () => setState(
        () => _state = _state.copyWith(
          healthInsurance: _controllers['healthInsurance']!.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  Future<int> _processNewBornEntry(NewBornEntry newBornEntry) async {
    final db = ref.watch(dbInstanceProvider);
    final uuid = ref.watch(uuidProvider);

    if (widget.newBornSheet == null) {
      return await createNewBornSheet(newBornEntry, db!, uuid!);
    } else {
      return await updateNewBornSheetBaseFields(
        widget.newBornSheet!.id,
        newBornEntry,
        db!,
        uuid!,
      );
    }
  }

  void _createRecordCallback(int recordId) {
    if (recordId > 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Entrada guardada'),
        duration: Durations.medium4,
      ));
      ref.invalidate(newBornSheetsProvider);
      Navigator.popAndPushNamed(context, newBornSheetsRoute);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No se pudo guardar'),
        duration: Durations.medium4,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ficha Recién Nacido"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoolButton(
              onPressed: () => Navigator.pushNamed(context, newBornEntryRoute),
              child: const Row(
                children: [
                  Icon(Icons.health_and_safety),
                  Icon(
                    Icons.add,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'A-001',
              labelText: 'Sector',
              controller: _controllers['sectorCode']!,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'A-001',
              labelText: 'Cama',
              controller: _controllers['bedCode']!,
            ),
            const SizedBox(height: 10),
            CustomDateTimePicker(
              currentValue: _state.entryDateTime,
              title: 'Fecha registro',
              updateValue: (value) => setState(
                  () => _state = _state.copyWith(entryDateTime: value)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Juan Pérez',
              labelText: 'Nombre RN',
              controller: _controllers['newBornName']!,
            ),
            const SizedBox(height: 10),
            CustomDateTimePicker(
              currentValue: _state.birthDateTime,
              title: 'Fecha de parto',
              updateValue: (value) => setState(
                  () => _state = _state.copyWith(birthDateTime: value)),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'FONASA',
              labelText: 'Previsión de salud',
              controller: _controllers['healthInsurance']!,
            ),
            const SizedBox(height: 10),
            _AssigneeSelector(
              assigneeId: _state.assigneeId,
              setAssignee: (assigneeId) => setState(() {
                _state = _state.copyWith(assigneeId: assigneeId);
              }),
            ),
            const SizedBox(height: 10),
            CoolButton(
              child: const Text('Guardar'),
              onPressed: () async {
                final recordId = await _processNewBornEntry(_state);
                _createRecordCallback(recordId);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AssigneeSelector extends ConsumerWidget {
  const _AssigneeSelector(
      {required this.assigneeId, required this.setAssignee});

  final String? assigneeId;
  final void Function(String) setAssignee;
  final defaultAssigneeName = 'Sin Profedional Asignada';

  String resolveAssigneeName(List<HealthProfessional> healthProfessionals) {
    if (assigneeId != null) {
      return healthProfessionals
              .firstWhereOrNull((element) => element.id == assigneeId)
              ?.name ??
          defaultAssigneeName;
    }
    return defaultAssigneeName;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(healthProfessionalsProvider).when(
        data: (healthProfessionals) => GestureDetector(
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black54, width: 1.5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profesional asignada',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.blue),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          resolveAssigneeName(healthProfessionals),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_drop_down, size: 40),
                  ],
                ),
              ),
              onTap: () async {
                final healthProfessionals =
                    await ref.watch(healthProfessionalsProvider.future);

                final healthProfessional = await showDialog<HealthProfessional>(
                  context: context,
                  builder: (BuildContext context) {
                    return HealthProfessionalsSelector(
                      healthProfessionals: healthProfessionals,
                    );
                  },
                );

                if (healthProfessional != null) {
                  setAssignee(healthProfessional.id);
                }
              },
            ),
        error: (e, s) => const Text("error"),
        loading: () => const CircularProgressIndicator());
  }
}
