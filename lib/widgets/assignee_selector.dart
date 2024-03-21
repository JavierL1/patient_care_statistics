import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/health_professional.dart';
import '../providers/health_professionals.dart';
import 'form_item_button.dart';
import 'health_professionals_selector.dart';

class AssigneeSelector extends ConsumerWidget {
  const AssigneeSelector({super.key, required this.assigneeId, required this.setAssignee});

  final String? assigneeId;
  final void Function(String) setAssignee;
  final defaultAssigneeName = 'Sin Profesional Asignada';

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
        data: (healthProfessionals) => FormItemButton(
              title: 'Profesional asignada',
              subtitle: resolveAssigneeName(healthProfessionals),
              onTap: () async {
                final healthProfessionals =
                    await ref.watch(healthProfessionalsProvider.future);

                if (!context.mounted) return;
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
