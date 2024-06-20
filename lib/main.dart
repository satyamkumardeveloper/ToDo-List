import 'package:flutter/material.dart';
import 'package:to_do/screens/Homescreen.dart';


// ...




void main()async{
  
  
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      
      title: 'ToDo',
      home: Homescreen(),
    );
  }
}