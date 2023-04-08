import 'package:flutter/material.dart';
import 'package:my_app/data/http_helper.dart';
import 'package:my_app/data/weather.dart';
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtplace=TextEditingController();
  Weather result=Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Weather')),
    body: Padding (padding: EdgeInsets.all(16),
    child: ListView(children: [Padding(padding: EdgeInsets.all(16),
    child: TextField(controller: txtplace,
    decoration: InputDecoration(hintText: 'Enter a City ',
    suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: getData)))),
    weatherRow('Place:', result.name),
    weatherRow('Description:', result.description),
    weatherRow('Temperature:', result.temperature.toStringAsFixed(2)),
    weatherRow('Preceived:', result.preceived.toStringAsFixed(2)),
    weatherRow('Pressure:', result.pressure.toString()),
    weatherRow('Humidity:', result.humidity.toString()),
    
    ]),
    ));}
  Future getData() async{
    HttpHelper Helper = HttpHelper();
    result=await Helper.getWeather(txtplace.text);
    setState(() {
      
    });}
    // in list view under the text field we want to place a several widgets that will contain a label
    //like a temp and a value instead of writing and stylish each one of widgets 
    //so create a function that return a widget that we can call and resue as needs 
    Widget weatherRow(String label, String value ){
      Widget row =Padding(padding:EdgeInsets.symmetric(vertical: 16),
      //when you want to divide the avaliable space in several parts (expand)
      child: Row(children:
       [Expanded(flex: 3,
       child: Text(label,style: 
       TextStyle(fontSize: 20,
       color: Theme.of(context).hintColor))),
       Expanded(flex:4,
       child: Text(value,style: 
       TextStyle(fontSize: 20,
       color: Theme.of(context).primaryColor),))
       ],),);
      
return row;
    }
}