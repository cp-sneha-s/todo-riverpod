import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey/todo_provider.dart';

import '../model/task.dart';
import 'add_task.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final todos = ref.watch(filteredTodos);
    bool filterApplied= ref.watch(filterProvider.notifier).state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          Row(
            children: [
              const Text('Apply Filter'),
              Switch(
                  activeColor: Colors.white,
                  value: filterApplied, onChanged: (value){
                    ref.read(filterProvider.notifier).state= value;
                  // filterApplied = value;
              }),
            ],
          )
        ],
      ),
      body: Consumer(
        builder: (context,ref,child) {
          return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context,index){
                      Task task = todos[index];
                      return ListTile(title: Text(task.name),trailing: Checkbox(value: task.completed,
                        onChanged: (bool? value) {
                        Task toggledTask= Task(name: task.name, completed: !task.completed,id: task.id);
                          ref.read(todoListProvider.notifier).toggle(toggledTask);
                        },),);
                    });

        }
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTaskPage()));
        },

      ),
    );
  }
}
