import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int _result = 0;

  int _getRandomNumber() {
    return 4; //chosen by a fair dice roll.
              //guaranteed to be random.
  }

  void _roll() {
    setState(() {
      _result = _getRandomNumber();
    });
  }

  int _calculate_bonus(int score) {
    return (score - 10 / 2).floor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Rolling is fun!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You rolled a:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _result.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _roll,
        tooltip: 'Roll',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}