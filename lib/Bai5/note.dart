import 'package:bai_tap/Bai5/addNote.dart';
import 'package:bai_tap/Bai5/fixNote.dart';
import 'package:flutter/material.dart';

class ListNote extends StatefulWidget {
  @override
  State<ListNote> createState() {
    // TODO: implement createState
    return AllNote();
  }
}

class AllNote extends State<ListNote> {
  List<String> titles = ["1", "2aaaa"];
  final TextEditingController input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(children: [Column(
        children: [
          for (int i = 0; i < titles.length; i++)
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () => _EditClick(i),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            titles[i],
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          )))),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () => _handleButtonPressed(i),
                  child: const Text('Remove'))
            ]),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: _navigateToNewScreen, child: const Text('Add'))
        ],
      )])
    ));
  }

  void _EditClick(int index) async{
    final add = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FixNote( title :titles[index])),
    );
    setState(() {
      titles[index] = add;
    });
  }
  void _handleButtonPressed(int index) {
    setState(() {
      titles.removeAt(index);
    });
  }

  void _navigateToNewScreen() async {
    final add = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNote()),
    );
    setState(() {
      titles.add(add);
    });
  }
}
