import 'package:flutter/material.dart';

class WorldStatScreen extends StatefulWidget {
  const WorldStatScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatScreen> createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Text('World Stat Screen',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
