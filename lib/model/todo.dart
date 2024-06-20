class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone=false
  });

  static List<Todo> todoList(){
    return [
      Todo(id: '01', todoText: 'GYM',isDone: true ),
      Todo(id: '02', todoText: 'Buy groceries', ),
      Todo(id: '03', todoText: 'Read a book', ),
      Todo(id: '04', todoText: 'Take dinner', ),
      Todo(id: '06', todoText: 'Cook dinner',isDone: true ),
      
    ];
  }

}
  


