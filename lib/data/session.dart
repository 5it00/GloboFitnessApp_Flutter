class Session{
//identifier
int id =0;
String date = '';
String description ='';
int duration =0;
//un named constructor 
Session(this.id,this.date,this.description,this.duration);

//named constructor (to create a session object from a map )
Session.fromJson(Map<String ,dynamic> sessionMap){
  //set all fields of objects with the values we retrive from sessionMap parameter
id = sessionMap['id']??0;
date = sessionMap['date']??'';
description = sessionMap['description']??'';
duration = sessionMap['duration']??0;
}
//transfrom a session object into a map 
  Map<String ,dynamic>  toJson(){

//return a map object 
return {
  'id':id,
  'date':date,
  'description':description,
  'duration':duration
};
  }

}

