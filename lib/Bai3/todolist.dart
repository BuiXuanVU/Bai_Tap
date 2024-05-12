import 'package:bai_tap/Bai3/addmore.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() {
    // TODO: implement createState
    return ListTittel();
  }
}

class ListTittel extends State<TodoList> {
  List<String> titles = ["1", "2"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          for (int i = 0; i < titles.length; i++)
            Row(children: [
              Expanded(
                child: Text(titles[i],
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(width: 80),
              ElevatedButton(
                  onPressed: () => _handleButtonPressed(i),
                  child: const Text('Remove'))
            ]),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _navigateToNewScreen, child: const Text('more'))
        ],
      ),
    ));
  }

  void _handleButtonPressed(int index) {
    setState(() {
      titles.removeAt(index);
    });
  }

  void _navigateToNewScreen()async {
    final add = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddMore()),
    );
    setState(() {
      print(add);
      titles.add(add);
    });
  }
}
