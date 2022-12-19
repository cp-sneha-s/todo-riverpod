import 'package:todoey/databse/db_provider.dart';

import '../model/task.dart';

class TodoRepository{
  final db= DbProvider.db;
  Future<List<Task>> getTasks(){
   return db.getAllTasks();
  }

  Future<void> addTask(Task task)async{
    db.addTask(task);
  }
}