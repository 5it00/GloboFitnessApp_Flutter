import 'package:flutter/material.dart';
class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //click into it and choose to extract widget and this will create a new class. 
    return BottomNavigationBar(
      //to use the bottom navigation , you use the ontap function and get the index of item you tapped
    onTap:(int index){
     switch (index) {
       case 0:
         Navigator.pushNamed(context, '/');
         break;
         case 1:
         Navigator.pushNamed(context,'/bmi');
       break;
     }
    },
    items:[
     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
     BottomNavigationBarItem(icon: Icon(Icons.monitor_weight),label: 'BMI Calculator'),]);
  }}