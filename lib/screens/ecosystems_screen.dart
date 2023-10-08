import 'package:flutter/material.dart';

class EcosystemsScreen extends StatelessWidget {
  const EcosystemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gifs/ecosystem.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Imagen de fondo
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gifs/ecosystem.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Botones
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Desplegar la ficha técnica de los arrecifes de coral
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Arrecifes de coral'),
                          content: Text(
                            'Los arrecifes de coral son ecosistemas complejos que albergan una gran variedad de plantas y animales. Son importantes para la pesca y el turismo.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Arrecifes de coral'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Desplegar la ficha técnica de las praderas marinas
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Praderas marinas'),
                          content: Text(
                            'Las praderas marinas son ecosistemas formados por pastos marinos. Son importantes para la protección de la costa y el hábitat de muchas especies marinas.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Praderas marinas'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Desplegar la ficha técnica de los fondos marinos
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Fondos marinos'),
                          content: Text(
                            'Los fondos marinos son ecosistemas que pueden ser muy diversos, dependiendo de la profundidad y el tipo de fondo. Pueden incluir bosques de algas, montañas submarinas y cañones.',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Fondos marinos'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
