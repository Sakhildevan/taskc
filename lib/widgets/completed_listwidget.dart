import 'package:taskc/provider/todos.dart';
import 'package:taskc/widgets/todo_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoCompleted;
    return todos.isEmpty
        ? Center(
            child: Text(
              "No completed Task",
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => Container(height: 20),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
