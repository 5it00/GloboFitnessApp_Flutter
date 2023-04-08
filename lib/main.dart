import 'package:flutter/material.dart';
import 'package:my_app/Screens/bmi_screen.dart';

import 'Screens/intro_screens.dart';
void main (){
  runApp(GloboApp());
}
class GloboApp extends StatelessWidget {
  const GloboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      //for the navigation will use named routes this allow to define all ur navigation in a single 
      //place when create ur material app
      //routes take a map which its a group   of keys and values 
      routes: {
        '/':(context) => Intro_Screen(),
        '/bmi': (context)=>BmiScreen(),
      },
      initialRoute: '/',
      //widget will fail to build  thats why red death error 
      //if u set an initial route in material app so you cant set the home of the material app.
     // home: Intro_Screen()
      );
      

    
  }
}
