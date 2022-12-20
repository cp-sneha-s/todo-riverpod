import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey/model/todo.dart';

class DbProvider {
  DbProvider._();

  static final DbProvider db = DbProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      _database;
    }
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    var path = await getDatabasesPath();
    String databasePath= join(path,"Todo");

    return await openDatabase(
        databasePath, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Task ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "name TEXT,"
          "completed INTEGER" ")"
      );
    });
  }
  Future<List<Todo>> getAllTasks()async{
    final db= await database;
    final List<Map<String,dynamic>> maps=await db.query("Task",orderBy: 'id');
    List<Todo> list=[];
    maps.forEach((result) {Todo task = Todo.fromMap(result);
    list.add(task);});
    return list;
  }
  Future<Todo> addTask(Todo task)async{
    final db= await database;
   task.id= await db.insert('Task', task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
   return task;
  }

  Future<int> toggleTask(Todo task)async{
    final db= await database;
  return  await db.update('Task', task.toMap(),where: "id = ?",whereArgs:[task.id] );
  }

  Future close()async{
    await db.close();
  }
}

