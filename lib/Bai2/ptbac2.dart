import 'dart:math';

import 'package:flutter/material.dart';

class Ptb2 extends StatefulWidget {
  @override
  State<Ptb2> createState() {
    return Ptb2State();
  }
}

class Ptb2State extends State<Ptb2> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ax2 + bx + c = 0'),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 80),
                    const Text(
                      "a = ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _aController,
                        keyboardType: TextInputType
                            .number, // Set keyboard type for numbers
                        decoration: const InputDecoration(
                            hintText: 'Enter coefficient a'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 80),
                    const Text(
                      "b = ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _bController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter coefficient b',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 80),
                    const Text(
                      "c = ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _cController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Enter coefficient c',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: Calculate,
                  child: const Text('Solve'),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void Calculate() {
    setState(() {
      if (_aController.text.isEmpty ||
          _bController.text.isEmpty ||
          _cController.text.isEmpty) {
        result = "Missing calculated value";
        return;
      }
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double c = double.parse(_cController.text);
      if (a == 0) {
        result = " a cannot be 0";
        return;
      }
      double discriminant = b * b - 4 * a * c;
      if (discriminant < 0) {
        result = 'The equation has no solution';
        return;
      }
      if (discriminant == 0) {
        result = 'The equation has 1 double solution x = ${-(b / 2 * a)}';
        return;
      }
      double x1 = (-b + sqrt(discriminant)) / (2 * a);
      double x2 = (-b - sqrt(discriminant)) / (2 * a);
      result = " The equation has 2 double solutions: \n"
          " x1 = ${x1.toStringAsFixed(2)} \n"
          " x2 = ${x2.toStringAsFixed(2)}";
    });
  }
}
