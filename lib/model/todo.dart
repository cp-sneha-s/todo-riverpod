class Todo {
   int? id;
   String name;
   bool completed;

  Todo({this.id, required this.name, required this.completed});

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map['id'],
        name: map['name'],
        completed: map['completed'] == 1 ? true : false);
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'completed': completed == true ? 1 : 0
    };
    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
