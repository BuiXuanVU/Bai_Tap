import 'package:bai_tap/Bai3/todolist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMore extends StatefulWidget {
  @override
  State<AddMore> createState() {
    return AddToList();
  }
}

class AddToList extends State<AddMore> {
  final TextEditingController _addText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: TextField(
              controller: _addText,
              keyboardType: TextInputType.text, // Set keyboard type for numbers
            )),
            const SizedBox(width: 80),
            ElevatedButton(
                onPressed: () => AddClick(), child: const Text('AddClick'))
          ],
        ),
      ),
    );
  }

  void AddClick() {
    setState(() {
      Navigator.pop(context,_addText.text.toString());
    });
  }
}
