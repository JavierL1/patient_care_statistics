import 'package:flutter/material.dart';
import 'views/health_professional.dart';
import 'views/health_professionals.dart';

import 'views/new_born_entry.dart';
import 'routes.dart';
import 'views/new_born_sheets.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case newBornSheetsRoute:
        return MaterialPageRoute(
          builder: (context) => const NewBornSheetsView(),
          settings: settings,
        );

      case newBornEntryRoute:
        final newBornSheet =
            ((settings.arguments ?? {}) as Map)['newBornSheet'];
        return MaterialPageRoute(
          builder: (context) => NewBornEntryView(newBornSheet: newBornSheet),
          settings: settings,
        );

      case healthProfessionalsRoute:
        return MaterialPageRoute(
          builder: (context) => const HealthProfessionalsView(),
          settings: settings,
        );

      case healthProfessionalRoute:
        final healthProfessional =
            ((settings.arguments ?? {}) as Map)['healthProfessional'];

        return MaterialPageRoute(
          builder: (context) => HealthProfessionalView(
            healthProfessional: healthProfessional,
          ),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NewBornEntryView(),
          settings: settings,
        );
    }
  }
}
