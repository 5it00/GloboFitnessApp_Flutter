
//http packages which being added to yaml file.
//you need to install and import all packages from website.
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/weather.dart';

import 'package:my_app/data/weather.dart';
//create a plain class not a widget.
//widget are a piece of inter face and class are just code.
//in this class will connect openWeatherAPI to retrieve current weather condition.
//for a specific city in the world.

class HttpHelper{
   //https://api.openweathermap.org/data/2.5/weather?q=Palestine
   //&appid=3c1611869c502610fbaecc9939ec2b01
   final String Authority =  'api.openweathermap.org';
   final String path = 'data/2.5/weather';
   final String ApiKey = '3c1611869c502610fbaecc9939ec2b01';
   //use future to asynchronous a task 
   Future<Weather> getWeather(String Location) async{
   Map<String,dynamic>parameters={'q':Location,'appID':ApiKey,};
   Uri uri= Uri.https(Authority,path,parameters);
   http.Response result =await http.get(uri); 
   Map<String,dynamic> date = json.decode(result.body);
   Weather weather = Weather.fromJson(date);
   return weather;
   }
}