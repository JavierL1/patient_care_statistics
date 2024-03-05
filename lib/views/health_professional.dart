import 'package:flutter/material.dart';

import '../form_payloads/health_professional_entry.dart';
import '../routes.dart';
import '../widgets/custom_text_field.dart';

class HealthProfessionalView extends StatefulWidget {
  const HealthProfessionalView({super.key});

  @override
  State<HealthProfessionalView> createState() => _HealthProfessionalViewState();
}

class _HealthProfessionalViewState extends State<HealthProfessionalView> {
  HealthProfessionalEntry _state = HealthProfessionalEntry.initial();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();

    _controllers['name'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.healthProfessional.name),
    );
    _controllers['profession'] = TextEditingController.fromValue(
      TextEditingValue(text: _state.healthProfessional.profession),
    );

    _controllers['name']!.addListener(
      () => setState(
        () => _state = _state.copyWith
            .healthProfessional(name: _controllers['name']!.text),
      ),
    );
    _controllers['profession']!.addListener(
      () => setState(
        () => _state = _state.copyWith
            .healthProfessional(profession: _controllers['profession']!.text),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200, // Background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  border:
                      Border.all(color: Colors.black54, width: 1.5), // Border
                ),
                child: TextButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, newBornEntryRoute)},
                  child: const Text("+ Nuevo Ingreso"),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
