import 'package:flutter/material.dart';

class EcosystemButton1 extends StatelessWidget {
  const EcosystemButton1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Desplegar la ficha técnica de los arrecifes de coral
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Lake Xochimilco'),
              content: const Column(
                children: [
                  Text(
                    "Type: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lake Xochimilco is a freshwater, eutrophic wetland.',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Level of danger: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Some of the main threats to the lake include pollution, overuse, and the encroachment of urban development.',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lake Xochimilco is known for its striking beauty and vibrant cultural significance. The canals are surrounded by lush greenery and colorful floating gardens, where local farmers cultivate flowers, vegetables, and ornamental plants.',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage('assets/images/ecosystems_1.jpg'),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Lake Xochimilco'),
    );
  }
}
