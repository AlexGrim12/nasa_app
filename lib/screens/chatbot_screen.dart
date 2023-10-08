import 'package:flutter/material.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:nasa_app/models/chat_card.dart';

late final String apiKey;

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  String content = 'Hi, I am a chatbot, ask me about the ocean.';
  List<Message> messages = [];
  late String apiKey;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    apiKey = 'AIzaSyDWnszd8THhYE-m9OH2AIripZBxboCkVao';
    messages.add(const Message(
        author: 'Willy 🤠', content: 'I\'m Willy, your favorite chatbot!'));
  }

  Future<void> chat(String message) async {
    const String chatModel = 'models/chat-bison-001';

    // Generate a message.
    final messagePrompt = MessagePrompt(
      messages: [
        Message(author: 'User', content: message), // Set the author to "User"
      ],
    );
    final messageRequest = GenerateMessageRequest(
      prompt: messagePrompt,
      temperature: 0.1,
    );

    final GeneratedMessage messageResponse =
        await GenerativeLanguageAPI.generateMessage(
      modelName: chatModel,
      request: messageRequest,
      apiKey: apiKey,
    );

    print(messageResponse);

    setState(() {
      messages.add(Message(author: 'You 🫵', content: message));
      messages.add(Message(
          author: 'Willy 🤠', content: messageResponse.candidates[0].content));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willy Bot'),
        backgroundColor: Colors.grey[900],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Print content
                  Expanded(
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = messages[index];
                        return ChatCard(
                          messageText: message.content,
                          senderName: message.author!, // set the sender name
                          messageTimestamp: 'Number of message: $index',
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex:
                            4, // Adjust the flex value to control the width of the text field.
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            labelText: 'Enter a question',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 48,
                        child: Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () async {
                                // Show the loading GIF
                                setState(() {
                                  isLoading = true;
                                });

                                // Call the chat() function
                                await chat(_controller.text);
                                _controller.clear();

                                // Hide the loading GIF
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Icon(Icons.send)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Show the loading GIF if isLoading is true
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
