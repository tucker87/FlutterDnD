import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/screens/character/ability_widget.dart';

class Ability {
  Ability({required this.name});

  final String name;
  int score() => rolls[1] + rolls[2] + rolls[3];
  List<int> rolls = [0,0,0,0];
}

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  final List<Ability> _abilityScores = [
    Ability(name: 'Strength'),
    Ability(name: 'Dexterity'),
    Ability(name: 'Constitution'),
    Ability(name: 'Intelligence'),
    Ability(name: 'Wisdom'),
    Ability(name: 'Charisma'),
  ];

  int _rollDie(int sides) {
    return Random().nextInt(sides) + 1;
  }

  List<int> _rollStat() {
    var rolls = [_rollDie(6), _rollDie(6), _rollDie(6), _rollDie(6)];
    rolls.sort();
    return rolls;
  }

  void _roll() {
    setState(() {
      for(var ability in _abilityScores) {
        ability.rolls = _rollStat();
      }
    });
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
            for(var score in _abilityScores)
              AbilityWidget(ability: score),
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