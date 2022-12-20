import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoey/model/task.dart';

import 'db_provider.dart';



class TodoManager extends StateNotifier<List<Task>>{
  TodoManager(this.dbProvider):super([]){
    getAllTasks();
  }
    DbProvider dbProvider;

    Future<void> getAllTasks()async{
      try{
        state= await dbProvider.getAllTasks();

      }on Exception catch(error){
        throw Exception(error.toString());
      }
    }

  Future<void> add(Task task)async{
   await  dbProvider.addTask(task);
  state= [...state,task];
}

Future<void> toggle(Task task)async{
      await dbProvider.toggleTask(task);
  state= [
    for(final todo in state)
      if(todo.id==task.id)
        task else todo
  ];

  
}}





final databaseProvider= Provider<DbProvider>((ref) {
  return DbProvider.db;
});

final todoListProvider= StateNotifierProvider<TodoManager,List<Task>>((ref) {
  final db= TodoManager(ref.watch(databaseProvider));
  return db;
});

final filterProvider= StateProvider<bool>((ref) => false);

final filteredTodos= Provider<List<Task>>((ref) {
  final filter= ref.watch(filterProvider);
  final todos= ref.watch(todoListProvider);
  if(filter ==false){
    return todos;
  }else{
    return todos.where((todo) => todo.completed).toList();
  }
});

