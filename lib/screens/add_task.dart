import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey/provider/todo_provider.dart';

import '../model/task.dart';

class AddTaskPage extends StatelessWidget {
   AddTaskPage({Key? key}) : super(key: key);
  TextEditingController taskNameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task'),),
      body: Consumer(
        builder: (context,ref,child) {
          return     Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 8.0),
                  child: Column(
                    children: [
                       TextField(
                        controller: taskNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Add task here',
                            border: OutlineInputBorder()
                        ),
                      ),
                      Consumer(
                        builder: (context,ref,child) {
                          return ElevatedButton(
                            onPressed: ()async {
                             await ref.watch(todoListProvider.notifier).add(Task(name:taskNameController.text,completed:false));
                              Navigator.pop(context);
                             },
                            child: const Text('Add task'),

                          );
                        }
                      )
                    ],
                  ),
                );
              },
    ));

  }
}
