import 'package:flutter/material.dart';


class AddTaskPage extends StatelessWidget {
   AddTaskPage({Key? key}) : super(key: key);
  TextEditingController taskNameController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task'),),
      body:      Padding(
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
                       ElevatedButton(
                            onPressed: ()async {
                              Navigator.pop(context);
                             },
                            child: const Text('Add task'),

                      )
                    ],
                  ),

    ));

  }
}
