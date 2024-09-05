



import 'package:flutter/material.dart';
import 'package:todo/utils/Todolist.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List todos = [
    ['Learn Web Development', true],
    ['Learn PHP', false],
    ['Learn HTML', true]
  ];

  void onCheckboxChanged(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todos.add([_controller.text, false]);
    });
  }

  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true, // Add this to make ListView take only the necessary space
        physics: const NeverScrollableScrollPhysics(), // Disable ListView's own scrolling
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Todolist(
            taskName: todos[index][0],
            taskCompleted: todos[index][1],
            onCheckboxChanged: (value) => onCheckboxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple,
                  hintText: 'Add a new task',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                ), 
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
            backgroundColor: Colors.white,
            foregroundColor: Colors.deepPurple,
          ),
        ],
        
      ),
    );
  }
}