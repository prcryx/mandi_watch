import 'package:flutter/material.dart';

class StateCard extends StatefulWidget {
  final String stateName;
  final VoidCallback onTap;
  const StateCard({super.key, required this.stateName, required this.onTap});

  @override
  State<StateCard> createState() => _StateCardState();
}

class _StateCardState extends State<StateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
    );
  }
}
