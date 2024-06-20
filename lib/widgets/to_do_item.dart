import 'package:flutter/material.dart';
import 'package:to_do/constrants/colors.dart';
import 'package:to_do/model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo,required this.onTodoChange,required this.onDeleteItem});
  final Todo todo;
  final onTodoChange;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChange(todo);
          
        },
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,color: tdBlue,),
        title: Text(todo.todoText!,style: TextStyle(color: tdBlack,fontSize: 16,decoration: todo.isDone? TextDecoration.lineThrough :null),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,width: 35,
          decoration: BoxDecoration(color: tdRed,
          borderRadius: BorderRadius.circular(5)),
          child: IconButton(icon: Icon(Icons.delete),color: Colors.white,iconSize: 18,
          onPressed: () {
            onDeleteItem(todo);
            
            
          },
          
          ),


          ),

      ),
    );
  }
}