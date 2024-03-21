import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/new_born_sheet.dart';
import '../enums/sex.dart';
import '../events/create_new_born_sheet.dart';
import '../events/update_new_born_sheet_base_fields.dart';
import '../form_payloads/new_born_entry.dart';
import '../providers/db.dart';
import '../providers/new_born_sheets.dart';
import '../providers/uuid.dart';
import '../routes.dart';
import '../widgets/assignee_selector.dart';
import '../widgets/cool_button.dart';
import '../widgets/custom_date_time_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/simple_picker.dart';

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
            AssigneeSelector(
              assigneeId: _state.assigneeId,
              setAssignee: (assigneeId) => setState(() {
                _state = _state.copyWith(assigneeId: assigneeId);
              }),
            ),
            const SizedBox(height: 10),
            SimplePicker<Sex>(
              title: 'Sexo',
              subtitle: sexToString(_state.sex),
              onSelect: (sex) => setState(() {
                _state = _state.copyWith(sex: sex);
              }),
              items: Sex.values
                  .map((e) => (name: sexToString(e), value: e))
                  .toList(),
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
