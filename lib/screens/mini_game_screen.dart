import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum DifficultyLevel { easy, medium, hard }

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
  final List<String> _imagePaths = [
    // Add the direction of your images here
    'assets/images/mini_game_img_1.png',
    'assets/images/mini_game_img_2.png',
    'assets/images/mini_game_img_3.png',
    'assets/images/mini_game_img_4.png',
    'assets/images/mini_game_img_5.png',
  ];
  late Timer _timer;
  int _timeLeft = 30;
  DifficultyLevel? _difficultyLevel;

  @override
  Widget build(BuildContext context) {
    if (_difficultyLevel == null) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gifs/mini_game_background_gif.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => _buildDifficultySelectionDialog(),
                    );
                  },
                  child: const Text('Start Game'),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gifs/mini_game_background_gif.gif'),
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
                    child: Image(
                      image: AssetImage(_selectRandomImage()),
                      width: 100,
                      height: 100,
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
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time left: $_timeLeft seconds',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Score: $_score',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void _startTimer() {
    _score = 0;
    _gameOver = false;
    _imageOffsets.clear();
    _addImage();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft--;
        if (_timeLeft == 0) {
          _endGame();
        }
      });
    });
    Timer.periodic(_getDifficultyLevelDuration(), (timer) {
      if (!_gameOver) {
        _addImage();
        setState(() {});
      }
    });
  }

  Duration _getDifficultyLevelDuration() {
    switch (_difficultyLevel) {
      case DifficultyLevel.easy:
        return const Duration(seconds: 10);
      case DifficultyLevel.medium:
        return const Duration(seconds: 7);
      case DifficultyLevel.hard:
        return const Duration(seconds: 5);
      default:
        return const Duration(seconds: 10);
    }
  }

  void _addImage() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      final maxWidth = MediaQuery.of(context).size.width - 120;
      final maxHeight = MediaQuery.of(context).size.height - 250;
      final x = _random.nextDouble() * maxWidth;
      final y = _random.nextDouble() * maxHeight;
      _imageOffsets.add(Offset(x, y));
    }
  }

  String _selectRandomImage() {
    return _imagePaths[_random.nextInt(_imagePaths.length)];
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
    _timer.cancel();
    if (_score >= 50) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'You Win!',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'You save the world!\nYour score: $_score',
            textAlign: TextAlign.center,
          ),
          actions: [
            const Image(image: AssetImage('assets/images/mini_game_end_1.jpg')),
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
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Game Over',
            textAlign: TextAlign.center,
          ),
          content: Text(
            'You failed to save the world!\nYour score: $_score',
            textAlign: TextAlign.center,
          ),
          actions: [
            const Image(image: AssetImage('assets/images/mini_game_end_2.jpg')),
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
  }

  Widget _buildDifficultySelectionDialog() {
    return AlertDialog(
      title: const Text('Select Difficulty'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Is your change to save the world!\n Your task is to tap on the images as fast as you can.\n Chose your difficulty level:\n',
            textAlign: TextAlign.center,
          ),
          RadioListTile<DifficultyLevel>(
            title: const Text('Easy'),
            value: DifficultyLevel.easy,
            groupValue: _difficultyLevel,
            onChanged: (value) {
              setState(() {
                _difficultyLevel = value;
                _timeLeft = 60;
              });
              Navigator.pop(context);
              _startTimer();
            },
          ),
          RadioListTile<DifficultyLevel>(
            title: const Text('Medium'),
            value: DifficultyLevel.medium,
            groupValue: _difficultyLevel,
            onChanged: (value) {
              setState(() {
                _difficultyLevel = value;
                _timeLeft = 45;
              });
              Navigator.pop(context);
              _startTimer();
            },
          ),
          RadioListTile<DifficultyLevel>(
            title: const Text('Hard'),
            value: DifficultyLevel.hard,
            groupValue: _difficultyLevel,
            onChanged: (value) {
              setState(() {
                _difficultyLevel = value;
                _timeLeft = 30;
              });
              Navigator.pop(context);
              _startTimer();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
