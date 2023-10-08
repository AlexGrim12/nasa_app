import 'package:nasa_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/screens/chatbot_screen.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:nasa_app/models/iahome_card.dart';

late final String apiKey = 'AIzaSyDWnszd8THhYE-m9OH2AIripZBxboCkVao';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String content = '';
  String content2 = '';

  Future<String> information(String message) async {
    const String textModel = 'models/text-bison-001';
    // Generate text.
    final textRequest = GenerateTextRequest(
      prompt: TextPrompt(text: message),
      temperature: 1.0,
      candidateCount: 1,
    );

    final response = await GenerativeLanguageAPI.generateText(
      modelName: textModel,
      request: textRequest,
      apiKey: apiKey,
    );

    // setState(() {
    //   content = response.candidates[0].output;
    // });
    print(response.candidates[0].output);
    return response.candidates[0].output;
  }

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gifs/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: [
              //img
              const Image(
                image: AssetImage('assets/gifs/tittle.png'),
                height: 100,
              ),
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
                      ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 50,
                          minHeight: 50,
                          minWidth: 400,
                          maxWidth: 400),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[700],
                          foregroundColor: Colors.white,
                          shadowColor: Colors.amber,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                        ),
                        onPressed: () async {
                          content = await information(
                              'tell me one hard fact about water pollution');
                          // if (content2 == '') {
                          content2 = await information(
                              'Tell me a solution of this problem: $content');
                          print(content2);
                          // }
                          setState(
                              () {}); // Update the UI after receiving content and content2
                        },
                        child: const Row(children: [
                          SizedBox(width: 10),
                          Text(
                            'Generate a Problem and Solution',
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        Card(
                          child: ContentCard(content: content, sop: 'Problem'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          child:
                              ContentCard(content: content2, sop: 'Solution'),
                        ),
                      ],
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
      ),
    );
  }
}
