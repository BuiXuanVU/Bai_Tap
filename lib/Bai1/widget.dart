import 'package:flutter/material.dart';

class Pttb1 extends StatefulWidget {
  const Pttb1({super.key});
  // Error message to display if input is invalid
  @override
  State<Pttb1> createState() => Pttb1State();
}

class Pttb1State extends State<Pttb1> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ax + b = 0'),
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
      if (_aController.text.isEmpty || _bController.text.isEmpty) {
        result = "Missing calculated value";
        return;
      }
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      if (a == 0) {
        result = " a cannot be 0";
        return;
      }
      result = (-b / a).toString();
    });
  }
}
