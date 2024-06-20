import 'package:flutter/material.dart';
import 'package:to_do/constrants/colors.dart';
import 'package:to_do/widgets/to_do_item.dart';
import 'package:to_do/model/todo.dart';

class Homescreen extends StatefulWidget {
   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final todosList=Todo.todoList();
  final _todoController=TextEditingController();
  List<Todo> _found=[];

  @override
  void initState() {
    _found=todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdbgColor,
      appBar: _builder_appBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Expanded(
                child: Column(children: [
                  searchBox(),
                  Expanded(child: ListView(
                    
                    children: [
                    Container(
                      margin: EdgeInsets.only(top:50,bottom: 20 ),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                    ),
                    for (Todo todo in _found.reversed)
                      ToDoItem(todo: todo,
                      onTodoChange: _handleToDoChange ,
                      onDeleteItem: _handlerDelete,
                      )
                    
                    
                    ],
                  )
                  ),
                  
                ],),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
                      color: tdGray,
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      spreadRadius: 0
                    )],
                    borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(hintText: 'Add new todo item',
                      border: InputBorder.none,

                      ),

                    ),
                  ),

                  ),
                  Container(
                    
                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child: ElevatedButton(child: Text(
                      "+",style: TextStyle(fontSize: 40,color: Colors.white) ,),
                      onPressed: () {
                        _addTodoItem(_todoController.text);
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        
                        
                      ),
                      ),
                  )
                ],
              ),
            ),

          ],
        ),
      );
  }


  void _handleToDoChange(Todo todo){
    setState(() {
      todo.isDone=!todo.isDone;
    });
    
  }
  void _handlerDelete(Todo todo){
    setState(() {
      todosList.removeWhere((item)=>item.id==todo.id);
    });
  }
  void _addTodoItem(String text){
    if (text.isEmpty){}
    else{
      setState(() {
      todosList.add(Todo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: text));
      _todoController.clear();
    });
    }
    
  }


  void _runFilter(String s){
    List<Todo> result=[];
    if (s.isEmpty){
      result=todosList;
    }else{
      result=todosList.where((item)=>item.todoText!.toLowerCase().contains(s.toLowerCase())).toList();
    }
    setState(() {
      _found=result;
    });
  }

  Widget searchBox(){
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  onChanged: (value)=> _runFilter(value),
                  decoration: InputDecoration(contentPadding:EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search,color: tdBlack,size: 20,),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                  border: InputBorder.none,
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: tdGray)
                  ),
                ),
            );
  }

  AppBar _builder_appBar(){
    return AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
          Icon(Icons.menu,
          color: Colors.black,
          size: 40,),
          Center(child: Text(
          'ToDo List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black
          ),
        ),),
        Container(
          height: 40,width: 40,
          child: ClipRRect(
            child: Image.asset('assets/img/profile.png'),
            borderRadius: BorderRadius.circular(20),),
        )


        ],
        ),
        backgroundColor: tdbgColor,
        
        toolbarHeight: 70,
        );
  }
}