import 'package:flutter/material.dart';

class Demi extends StatefulWidget {
  const Demi({super.key});

  @override
  State<Demi> createState() => _DemiState();
}

class _DemiState extends State<Demi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}
