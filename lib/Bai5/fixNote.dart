import 'package:flutter/material.dart';

class FixNote extends StatefulWidget {
  final String title;
  const FixNote({super.key, required this.title});
  @override
  State<FixNote> createState() {
    return FixElement();
  }
}

class FixElement extends State<FixNote> {
  final TextEditingController _addText = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addText.text = widget.title;
  }
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
                onPressed: () => FixClick(), child: const Text('FixClick'))
          ],
        ),
      ),
    );
  }

  void FixClick() {
    setState(() {
      Navigator.pop(context,_addText.text.toString());
    });
  }
}
