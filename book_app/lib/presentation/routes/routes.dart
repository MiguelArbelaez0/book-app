import 'package:book_app/data/models/document_model.dart';
import 'package:book_app/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "detail_screen":
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            document: settings.arguments as Document,
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
