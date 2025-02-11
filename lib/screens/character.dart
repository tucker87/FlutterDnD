import 'dart:math';

import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int _result = 0;
  List<int> _rolls = [];

  int _rollDie(int sides) {
    return Random().nextInt(sides) + 1;
  }

  int _rollStat() {
    _rolls = [_rollDie(6), _rollDie(6), _rollDie(6), _rollDie(6)];
    _rolls.sort();
    return _rolls[1] + _rolls[2] + _rolls[3];
  }

  void _roll() {
    setState(() {
      _result = _rollStat();
    });
  }

  int _calculateBonus(int score) {
    return ((score - 10) / 2).floor();
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
              '$_result $_rolls',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              'Modifier:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _calculateBonus(_result).toString(),
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