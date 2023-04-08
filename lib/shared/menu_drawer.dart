import 'package:flutter/material.dart';
import 'package:my_app/Screens/WeatherScreen.dart';
import 'package:my_app/Screens/sessionScreen.dart';
import 'package:my_app/data/sp_helper.dart';
import '../Screens/bmi_screen.dart';
import '../Screens/intro_screens.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children:buildMenuItem(context),),);
  }

  List<Widget> buildMenuItem(BuildContext context){
    final List<String> menuIitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];
    List<Widget> menuItem=[];
    menuItem.add(DrawerHeader(decoration: BoxDecoration(color: Colors.blueGrey),
    child: Text('Globo Fitness',style: TextStyle(color: Colors.white,fontSize: 25))));

    menuIitles.forEach(( String element) { 
      Widget screen=Container();
      menuItem.add(ListTile(title: Text(element,style: TextStyle(fontSize: 20)),
      onTap: (){switch (element) {
        case 'Home':
        screen=Intro_Screen();
        break;
        case 'BMI Calculator':
          screen=BmiScreen();
          break;
          case 'Weather':
          screen=WeatherScreen();
          break;
          case 'Training':
          screen=Sessionscreen();
          break;

      }
      //to back direct into home will remove the drawer from stack .
      Navigator.of(context).pop();

      //if u click will response. but the drawer will stay (opens again )and thats due to flutter 
      // add the drawer to the navigation stack 
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
      },));
    });
    return menuItem;

  }
}