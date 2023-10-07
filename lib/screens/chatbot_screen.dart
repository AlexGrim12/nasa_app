import 'package:flutter/material.dart';

import 'package:google_generative_language_api/google_generative_language_api.dart';

late final String apiKey;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  String content = 'Hi, I am a chatbot, ask me about the ocean.';

  Future<void> chat(String message) async {
    apiKey = 'AIzaSyDWnszd8THhYE-m9OH2AIripZBxboCkVao';

    const String chatModel = 'models/chat-bison-001';

    // Generate a message.
    final messagePrompt = MessagePrompt(
      messages: [
        Message(author: '1', content: message),
      ],
    );
    final messageRequest = GenerateMessageRequest(
      prompt: messagePrompt,
    );

    final GeneratedMessage messageResponse =
        await GenerativeLanguageAPI.generateMessage(
      modelName: chatModel,
      request: messageRequest,
      apiKey: apiKey,
    );

    // Update the content variable with the content of the second candidate.
    setState(() {
      content = messageResponse.candidates[0].content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Message',
              ),
            ),

            ElevatedButton(
                onPressed: () {
                  chat(_controller.text);
                  _controller.clear();
                },
                child: const Text('Chatbot')),
            // Print content
            Text(content),
          ]),
        ),
      ),
    );
  }
}
