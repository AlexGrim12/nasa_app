import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

import 'package:nasa_app/widgets/widgets.dart';

const double width_btn = 400;
const double height_btn = 200;

class Pez {
  var Id;
  var nombre;
  var aporte;
  var en_peligro;
  var img_route;

  Pez(
    String id,
    String nom,
    String apor,
    bool peligro,
    String dat,
    String ruta,
  ) {
    Id = id;
    nombre = nom;
    aporte = apor;
    en_peligro = peligro;
    img_route = ruta;
  }
}

class PondScreen extends StatefulWidget {
  const PondScreen({super.key});

  @override
  AnimacionState createState() => AnimacionState();
}

class AnimacionState extends State<PondScreen> {
  var scan;
  final double height_img = 100;
  final double width_img = 100;

  final pezaImg_path = "assets/images/clown_fish.png";
  final pezbImg_path = "assets/images/white_shark.png";
  final pezcImg_path = "assets/images/axolotl.png";

  @override
  void initState() {
    super.initState();

    scan = Escaner();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selected = true;
      });
    });
  }

  bool selected = false;

  int aleatorio(int min, int max) {
    return Random().nextInt(max - min + 1) + min;
  }

  @override
  Widget build(BuildContext context) {
    const double izq = 30;
    final double der = 300;

    final Pez pez_a = Pez(
      "clownfish",
      "Clownfish",
      "The clownfish is a fish that inhabits the seas",
      false,
      "A curious fact about clownfish is that they are orange with white",
      pezaImg_path,
    );
    final Pez pez_b = Pez(
      "shark",
      "White Shark",
      "The shark is an aquatic animal that lives in the sea",
      false,
      "A curious fact about sharks is that they have very sharp teeth",
      pezbImg_path,
    );
    final Pez pez_c = Pez(
      "axolotl",
      "Axolotl",
      "The axolotl is an aquatic animal that lives in the water of the seas",
      true,
      "A curious fact about axolotls is that they can regenerate their limbs",
      pezcImg_path,
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gifs/mini_game_background_gif.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  width: width_img,
                  height: height_img,
                  top: 100,
                  left: selected ? izq : der,
                  duration: Duration(seconds: aleatorio(5, 20)),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                      onTap: () {
                        scan.DialogoPez(context, pez_a);
                      },
                      child: Center(
                        child: Image(
                            image: Image.asset(
                          pezaImg_path,
                          scale: 0.2,
                        ).image),
                      )),
                ),
                AnimatedPositioned(
                  width: width_img,
                  height: height_img,
                  left: !selected ? izq : der,
                  top: 350,
                  duration: Duration(seconds: aleatorio(5, 20)),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          scan.DialogoPez(context, pez_b);
                        });
                      },
                      child: Center(
                        child: Image(
                            image: Image.asset(
                          pezbImg_path,
                          scale: 0.2,
                        ).image),
                      )),
                ),
                AnimatedPositioned(
                  width: width_img,
                  height: height_img,
                  left: selected ? izq : der,
                  top: 520,
                  duration: Duration(seconds: aleatorio(5, 20)),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          scan.DialogoPez(context, pez_c);
                        });
                      },
                      child: Center(
                        child: Image(
                            image: Image.asset(
                          pezcImg_path,
                          scale: 0.2,
                        ).image),
                      )),
                ),
                AnimatedPositioned(
                  width: 100,
                  height: 100.0,
                  bottom: 20,
                  left: 150,
                  duration: const Duration(seconds: 5),
                  curve: Curves.fastOutSlowIn,
                  child: FloatingActionButton.large(
                    onPressed: () {
                      scan.scanCode(context);
                    },
                    child: const Icon(Icons.camera),
                  ),
                ),
                AnimatedPositioned(
                  width: 60,
                  height: 60.0,
                  bottom: 40,
                  left: 75,
                  duration: const Duration(seconds: 5),
                  curve: Curves.fastOutSlowIn,
                  child: FloatingActionButton.large(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.exit_to_app),
                  ),
                ),
                AnimatedPositioned(
                  width: 60,
                  height: 60.0,
                  bottom: 40,
                  left: 265,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: FloatingActionButton.large(
                    onPressed: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: const Icon(Icons.double_arrow),
                  ),
                ),
                const ChatBotButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Escaner {
  var pez_a;
  var pez_b;
  var pez_c;

  Escaner() {
    const pezaImg_path = "assets/images/clown_fish.png";
    const pezbImg_path = "assets/images/white_shark.png";
    const pezcImg_path = "assets/images/axolotl.png";

    pez_a = Pez(
      "clownfish",
      "Clownfish",
      "The clownfish is a fish that inhabits the seas",
      false,
      "A curious fact about clownfish is that they are orange with white",
      pezaImg_path,
    );
    pez_b = Pez(
      "white_shark",
      "White Shark",
      "The shark is an aquatic animal that lives in the sea",
      false,
      "A curious fact about sharks is that they have very sharp teeth",
      pezbImg_path,
    );
    pez_c = Pez(
      "axolotl",
      "Axolotl",
      "The axolotl is an aquatic animal that lives in the water of the seas",
      true,
      "A curious fact about axolotls is that they can regenerate their limbs",
      pezcImg_path,
    );
  }

  Future<void> scanCode(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    if (result.rawContent == "Pez_Payaso") {
      DialogoScan(context, pez_a);
    }
    if (result.rawContent == "Tiburon_Blanco") {
      DialogoScan(context, pez_b);
    }
    if (result.rawContent == "http://Axolote") {
      DialogoScan(context, pez_c);
    }
  }

  Future<void> DialogoScan(BuildContext context, Pez pez) async =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(pez.nombre),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image(
                      image: Image.asset(
                    pez.img_route,
                    scale: 0.2,
                  ).image),
                  Text("\n\n${pez.aporte}\n\n"),
                  Text(
                      "${!pez.en_peligro ? "This species is not in danger of extinction" : "This species is in danger of extinction"}\n\n")
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Add to pond'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

  Future<void> DialogoPez(BuildContext context, Pez pez) async =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(pez.nombre),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image(
                      image: Image.asset(
                    pez.img_route,
                    scale: 0.2,
                  ).image),
                  Text("\n\n${pez.aporte}\n\n"),
                  Text(
                      "${!pez.en_peligro ? "This species is not in danger of extinction" : "This species is in danger of extinction"}\n\n")
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
}
