import 'package:flutter/material.dart';
import 'package:nasa_app/screens/chatbot_screen.dart';
import '../../models/models.dart';
import '../../screens/home_screen.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home Screen',
        screen: const HomeScreen()),
    MenuOption(
        route: 'chatbot',
        icon: Icons.chat,
        name: 'Chat Bot',
        screen:  ChatbotScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    {
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    }
  }
}
