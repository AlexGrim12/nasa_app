import 'package:flutter/material.dart';

class EcosystemButton2 extends StatelessWidget {
  const EcosystemButton2({
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
              title: const Text('Acapulco Beach'),
              content: const Column(
                children: [
                  Text(
                    "Type:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'Acapulco Beach is a saltwater beach on the Pacific coast of Mexico.'),
                  SizedBox(height: 10),
                  Text(
                    "Level of danger: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'It is important to be aware of the natural dangers that can pose a threat to swimmers and beachgoers.'),
                  SizedBox(height: 10),
                  Text(
                    "Description: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'The beach is located in the city of Acapulco, which is about 200 miles southwest of Mexico City. Acapulco is a popular resort town that is known for its many hotels, restaurants, and bars. The city also has a number of historical and cultural attractions.'),
                  SizedBox(height: 20),
                  Image(
                    image: AssetImage('assets/images/ecosystems_2.jpg'),
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
      child: const Text('Acapulco Beach'),
    );
  }
}
