import 'package:flutter/material.dart';
import 'package:patient_care_statistics/widgets/cute_box.dart';

import '../aggregates/health_professional.dart';

class HealthProfessionalsSelector extends StatelessWidget {
  const HealthProfessionalsSelector({
    super.key,
    required this.healthProfessionals,
  });

  final List<HealthProfessional> healthProfessionals;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Selecciona la profesional',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      children: healthProfessionals
          .map(
            (healthProfessional) => SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, healthProfessional);
              },
              child: CuteBox(
                child: Column(
                  children: [
                    Text(
                      healthProfessional.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      healthProfessional.profession,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
