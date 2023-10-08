import 'package:flutter/material.dart';

class EcosystemButton3 extends StatelessWidget {
  const EcosystemButton3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Lake Chapala'),
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
                      'Lake Chapala is a freshwater lake in Mexico. It is the largest freshwater lake in Mexico.'),
                  SizedBox(height: 10),
                  Text(
                    "Level of danger: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Is not typically associated with significant natural dangers. Water quality can vary, and in some parts of the lake, pollution can be a concern.'),
                  SizedBox(height: 10),
                  Text(
                    "Description: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Lake Chapala is home to a diverse range of flora and fauna. It supports various fish species, including whitefish, catfish, and carp. The lake and its surroundings are also habitat to numerous bird species, making it a popular destination for birdwatchers.'),
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage('assets/images/ecosystems_3.jpg'),
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
      child: const Text('Lake Chapala'),
    );
  }
}
