import 'dart:math';

import 'package:flutter/material.dart';

class MiniGameScreen extends StatefulWidget {
  const MiniGameScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MiniGameState createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGameScreen> {
  int _score = 0;
  bool _gameOver = false;
  final Random _random = Random();
  final List<Offset> _imageOffsets = [];

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _score = 0;
    _gameOver = false;
    _imageOffsets.clear();
  }

  void _addImage() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      final maxWidth = MediaQuery.of(context).size.width - 100;
      final maxHeight = MediaQuery.of(context).size.height - 175;
      final x = _random.nextDouble() * maxWidth;
      final y = _random.nextDouble() * maxHeight;
      _imageOffsets.add(Offset(x, y));
    }
  }

  void _onImageTap(int index) {
    if (!_gameOver) {
      _score++;
      _imageOffsets.removeAt(index);
      _addImage();
      setState(() {});
    }
  }

  void _endGame() {
    _gameOver = true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text('Your score: $_score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'home');
              setState(() {});
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Tapping Game'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 16.0),
            child: Text(
              'Score: $_score',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/originals/39/45/69/394569b298236ed3bd6f2ae5069bc654.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            for (int i = 0; i < _imageOffsets.length; i++)
              Positioned(
                left: _imageOffsets[i].dx,
                top: _imageOffsets[i].dy,
                child: InkWell(
                  onTap: () => _onImageTap(i),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/4947/4947506.png',
                    width: 75,
                    height: 75,
                  ),
                ),
              ),
            if (_gameOver)
              Center(
                child: Text(
                  'Game Over\nScore: $_score',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _endGame,
        child: const Icon(Icons.stop),
      ),
    );
  }
}
