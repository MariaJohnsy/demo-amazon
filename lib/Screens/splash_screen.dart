import 'dart:async';
import 'package:flutter/material.dart'; 
void main() { 
  runApp(MyApp()); 
} 
  
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: "AMAZON", 
      theme: ThemeData( 
        primarySwatch: Colors.green, 
      ), 
      home: MyHomePage(), 
      debugShowCheckedModeBanner: false, 
    ); 
  } 
} 
  
class MyHomePage extends StatefulWidget { 
  @override 
  _MyHomePageState createState() => _MyHomePageState(); 
} 
class _MyHomePageState extends State<MyHomePage> { 
  @override 
  void initState() { 
    super.initState(); 
    Timer(const Duration(seconds: 3), 
  ()=>Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: (context) =>  SecondScreen()),
  ), 
  ); 
  } 
  @override 
  Widget build(BuildContext context) { 
    return Container( 
      color: Colors.white, 
      child:FlutterLogo(size:MediaQuery.of(context).size.height) 
    ); 
  } 
} 
class SecondScreen extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title:const Text("AMAZON")), 
      body: const Center( 
        child:Text("Work hard. Have fun. Make history."),
      ), 
    ); 
  } 
} 