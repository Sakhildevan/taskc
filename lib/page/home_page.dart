import 'package:taskc/home.dart';
import 'package:taskc/model/todo.dart';
import 'package:taskc/page/add_event.dart';
import 'package:taskc/provider/todos.dart';
import 'package:taskc/widgets/completed_listwidget.dart';
import 'package:taskc/widgets/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskc/api/firebase_api.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    Title:
    'todo';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined, size: 28), label: 'ToDo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done, size: 28), label: 'Completed')
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          final todos = snapshot.data;
          print('Todos: $todos');
          final provider = Provider.of<TodosProvider>(context);
          provider.setTodos;
          return tabs[selectedIndex];
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.red.shade400,
        onPressed: () => showDialog(
            context: context, builder: (context) => EventEditingPage()),
        child: Icon(Icons.add),
      ),
    );
  }
}
