import 'package:flutter/material.dart';

import '../model/todo.dart';
import 'add_task.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  List<Todo> todos=[];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          Row(
            children: [
              const Text('Apply Filter'),
              Switch(
                  activeColor: Colors.white,
                  value: false,
                  onChanged: (value){
              }),
            ],
          )
        ],
      ),
      body: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context,index) {
                      Todo task = todos[index];
                      return ListTile(title: Text(task.name),
                        trailing: Checkbox(value: task.completed,
                          onChanged: (bool? value) {
                            Todo toggledTask = Todo(name: task.name,
                                completed: !task.completed,
                                id: task.id);
                          },),);
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
