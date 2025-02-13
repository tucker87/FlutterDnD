import 'package:flutter/material.dart';
import 'package:flutter_dnd/screens/character/character_page.dart';

class AbilityWidget extends StatefulWidget {
  final Ability ability;
  const AbilityWidget({super.key, required this.ability});

  @override
  State<AbilityWidget> createState() => _AbilityWidgetState();
}

class _AbilityWidgetState extends State<AbilityWidget> {
  int _calculateBonus(int score) {
    return ((score - 10) / 2).floor();
  }

  @override
   Widget build(BuildContext context) {
    return Text('${widget.ability.name}: ${widget.ability.score()} ${widget.ability.rolls} ${_calculateBonus(widget.ability.score())}');
  }
}