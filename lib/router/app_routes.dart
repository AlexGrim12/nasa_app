import 'package:flutter/material.dart';
import 'package:nasa_app/screens/chatbot_screen.dart';
import 'package:nasa_app/screens/mini_game_screen.dart';
import '../../models/models.dart';
import '../../screens/home_screen.dart';
import '../screens/testing_screen.dart';
import '../screens/ecosystems_screen.dart';

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
        route: 'testing',
        icon: Icons.abc,
        name: 'testing',
        screen: const TestingScreen()),
    MenuOption(
        route: 'ecosystems',
        icon: Icons.eco,
        name: 'Ecosystems',
        screen: const EcosystemsScreen()),
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
