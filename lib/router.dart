import 'package:flutter/material.dart';
import 'package:patient_care_statistics/views/health_professional.dart';

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

      case healthProfessionalRoute:
        return MaterialPageRoute(
          builder: (context) => const HealthProfessionalView(),
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
