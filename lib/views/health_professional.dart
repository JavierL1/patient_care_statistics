import 'package:flutter/material.dart';
import 'package:patient_care_statistics/aggregates/health_professional.dart';
import 'package:patient_care_statistics/form_payloads/health_professional_entry.dart';
import 'package:patient_care_statistics/widgets/custom_text_field.dart';

import '../routes.dart';

class HealthProfessionalView extends StatefulWidget {
  const HealthProfessionalView({super.key});

  @override
  State<HealthProfessionalView> createState() => _HealthProfessionalViewState();
}

class _HealthProfessionalViewState extends State<HealthProfessionalView> {
  HealthProfessionalEntry state = HealthProfessionalEntry(
    insertedAt: DateTime.now(),
    healthProfessional: const HealthProfessional(name: "", profession: ""),
  );

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
                  updateValue: (text) => setState(() =>
                      state = state.copyWith.healthProfessional(name: text)),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "Fonoaudióloga",
                  labelText: "Profesión",
                  updateValue: (text) => state =
                      state.copyWith.healthProfessional(profession: text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
