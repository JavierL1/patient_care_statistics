import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/health_professional.dart';
import '../events/create_health_professional.dart';
import '../events/update_health_professional.dart';
import '../form_payloads/health_professional_entry.dart';
import '../providers/db.dart';
import '../providers/health_professionals.dart';
import '../providers/uuid.dart';
import '../routes.dart';
import '../widgets/cool_button.dart';
import '../widgets/custom_text_field.dart';

class HealthProfessionalView extends ConsumerStatefulWidget {
  final HealthProfessional? healthProfessional;

  const HealthProfessionalView({super.key, this.healthProfessional});

  @override
  ConsumerState<HealthProfessionalView> createState() =>
      _HealthProfessionalViewState();
}

class _HealthProfessionalViewState
    extends ConsumerState<HealthProfessionalView> {
  HealthProfessionalEntry _state = HealthProfessionalEntry.initial();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();

    if (widget.healthProfessional != null) {
      _state = HealthProfessionalEntry.fromHealthProfessional(
        widget.healthProfessional!,
      );
    }

    _controllers['name'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.name),
    );
    _controllers['profession'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.profession),
    );

    _controllers['name']!.addListener(
      () => setState(
        () => _state = _state.copyWith(name: _controllers['name']!.text),
      ),
    );
    _controllers['profession']!.addListener(
      () => setState(
        () => _state =
            _state.copyWith(profession: _controllers['profession']!.text),
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

  Future<int> _processHealthProfessionalEntry(
    HealthProfessionalEntry healthProfessionalEntry,
  ) async {
    final db = ref.watch(dbInstanceProvider);
    final uuid = ref.watch(uuidProvider);

    if (widget.healthProfessional == null) {
      return await createHealthProfessional(
          healthProfessionalEntry, db!, uuid!);
    } else {
      return await updateHealthProfessional(
        widget.healthProfessional!.id,
        healthProfessionalEntry,
        db!,
        uuid!,
      );
    }
  }

  void _createRecordCallback(int recordId) {
    if (recordId > 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Profesional de la Salud guardado'),
        duration: Durations.medium4,
      ));
      ref.invalidate(healthProfessionalsProvider);
      Navigator.pop(context);
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Ingresar Profesional de la Salud",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "Dámaris Suárez",
              labelText: "Nombre",
              controller: _controllers['name']!,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: "Fonoaudióloga",
              labelText: "Profesión",
              controller: _controllers['profession']!,
            ),
            const SizedBox(height: 10),
            CoolButton(
              child: const Text('Guardar'),
              onPressed: () async {
                final recordId = await _processHealthProfessionalEntry(_state);
                _createRecordCallback(recordId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
