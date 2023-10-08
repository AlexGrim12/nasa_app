import 'package:nasa_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/screens/chatbot_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  for (final option in menuOptions)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, option.route);
                      },
                      child: Row(children: [
                        Icon(option.icon),
                        const SizedBox(width: 10),
                        Text(
                          option.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ]),
                      //
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15.0),
                    shadowColor: Colors.amber,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Dialog(
                          shadowColor: Colors.amber,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                          child: ChatbotScreen(),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.chat_bubble),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
