import 'package:flutter/material.dart';

import 'package:nasa_app/widgets/widgets.dart';

class EcosystemsScreen extends StatelessWidget {
  const EcosystemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bodies of water near your location')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gifs/ecosystem.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Imagen de fondo
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gifs/ecosystem.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Botones
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: EcosystemButton1(),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: EcosystemButton2(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: EcosystemButton3(),
              ),
            ),
            const ChatBotButton(),
          ],
        ),
      ),
    );
  }
}
