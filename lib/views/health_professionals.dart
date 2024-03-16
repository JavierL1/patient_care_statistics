import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../aggregates/health_professional.dart';
import '../providers/health_professionals.dart';
import '../routes.dart';
import '../widgets/cool_button.dart';

class HealthProfessionalsView extends ConsumerWidget {
  const HealthProfessionalsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoolButton(
              onPressed: () => Navigator.pushNamed(context, newBornSheetsRoute),
              child: const Icon(Icons.baby_changing_station),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Profesionales de la Salud")),
      body: ref.watch(healthProfessionalsProvider).when(
            data: (healthProfessionals) =>
                _Body(healthProfessionals: healthProfessionals),
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

class _Body extends StatelessWidget {
  const _Body({required this.healthProfessionals});

  final List<HealthProfessional> healthProfessionals;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        healthProfessionals.isNotEmpty
            ? _ProfessionalsLister(healthProfessionals: healthProfessionals)
            : const Center(child: Text("No hay registros")),
        Positioned(
          bottom: 10,
          right: 10,
          child: CoolButton(
            onPressed: () =>
                Navigator.pushNamed(context, healthProfessionalRoute),
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

class _ProfessionalsLister extends StatelessWidget {
  const _ProfessionalsLister({
    required this.healthProfessionals,
  });

  final List<HealthProfessional> healthProfessionals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: healthProfessionals.length,
            itemBuilder: (context, index) {
              final healthProfessional = healthProfessionals[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(
                    healthProfessional.name,
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
                          const Icon(Icons.work),
                          const SizedBox(width: 10),
                          Text(healthProfessional.profession),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => {
                    Navigator.pushNamed(context, healthProfessionalRoute,
                        arguments: {"healthProfessional": healthProfessional})
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
