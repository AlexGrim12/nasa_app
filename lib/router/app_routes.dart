import 'package:flutter/material.dart';
import 'package:nasa_app/models/menu_options.dart';

import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'chatbot',
        icon: Icons.chat,
        name: 'Chat Bot',
        screen: const ChatbotScreen()),
    MenuOption(
        route: 'minigame',
        icon: Icons.games,
        name: "Mini Game",
        screen: const MiniGameScreen()),
    MenuOption(
        route: 'ecosystems',
        icon: Icons.eco,
        name: 'Ecosystems',
        screen: const EcosystemsScreen()),
    MenuOption(
      route: 'pond',
      icon: Icons.camera_alt,
      name: 'Pond',
      screen: PondScreen(),
    ),
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
