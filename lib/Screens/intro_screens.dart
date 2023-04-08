import 'package:flutter/material.dart';

import '../shared/MenuBottom.dart';
import '../shared/menu_drawer.dart';
class Intro_Screen extends StatelessWidget {
  const Intro_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Globo Fitnes')),
    drawer: MenuDrawer(),
    bottomNavigationBar: MenuBottom(),   
  body: Container(
    decoration: BoxDecoration(image: DecorationImage(image:AssetImage ('assets/beach.jpg'),
    fit:BoxFit.cover,
    )
     ),
      child: Center(child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(25))
        ),
    
        
        child: Text('commit to be fit , dare  to be great \n with  globo Fitness.',
        textAlign: TextAlign.center, 
        style: TextStyle(fontSize: 22, shadows: [
           Shadow(
            offset: Offset(1.0,1.0),
            blurRadius: 2.0,
            color:Colors.grey,
           )

        ]),
        
        )
      
        ))
 ) );}}


  
