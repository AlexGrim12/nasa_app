import 'package:flutter/material.dart';
import 'package:nasa_app/screens/screens.dart';

class ChatBotButton extends StatelessWidget {
  const ChatBotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
                  child: ChatbotScreen(),
                );
              },
            );
          },
          child: const Icon(Icons.chat_bubble),
        ),
      ),
    );
  }
}
