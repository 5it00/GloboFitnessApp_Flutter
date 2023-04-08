 class Weather{
  String name = '';
  String description ='';
  double temperature =0;
  double preceived=0;
  int pressure = 0;
  int humidity = 0;
  Weather(this.name,this.description,this.temperature,this.preceived,this.pressure,this.humidity);
  Weather.fromJson(Map<String,dynamic> WeatherMap){
    this.name=WeatherMap['name'];
    this.temperature=(WeatherMap['main']['temp']-237.15)??0;
    this.preceived=(WeatherMap['main']['feels_like']-237.15)??0;
     this.pressure=WeatherMap['main']['pressure']??0;
      this.humidity=WeatherMap['main']['humidity']??0;
      this.description=WeatherMap['weather'][0]['main']??'';
  }
 }