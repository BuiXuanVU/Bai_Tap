import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  @override
  State<AddNote> createState() {
    return AddToList();
  }
}

class AddToList extends State<AddNote> {
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
