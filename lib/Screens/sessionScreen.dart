import 'package:flutter/material.dart';
import 'package:my_app/data/session.dart';
import 'package:my_app/data/sp_helper.dart';
class Sessionscreen extends StatefulWidget {
  const Sessionscreen({super.key});

  @override
  State<Sessionscreen> createState() => _SessionscreenState();
}

class _SessionscreenState extends State<Sessionscreen> {
  List<Session>sessions=[];
  final TextEditingController txtDescription =TextEditingController();
  final TextEditingController txtDuration =TextEditingController();
  final sp_helper helper= sp_helper();
@override
  void initState() {
    // TODO: implement initState
    helper.init().then((value) {updateScreen();});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar (title: Text('Your Training Session ')),
    body: ListView(children: getContent(),),
    floatingActionButton: FloatingActionButton(child: Icon (Icons.add),onPressed: () {
      ShowSessionDialog(context);
      
    },),
    
    );
  }
  Future <dynamic> ShowSessionDialog(BuildContext context)async{
    return showDialog(context: context, builder:( BuildContext context){
      return AlertDialog(
        title: Text('Insert Training Session '),
        content: SingleChildScrollView(child: 
        Column(children: [
          TextField(controller: txtDescription,decoration: InputDecoration(hintText: 'Description'),),
          
           TextField(controller: txtDuration,decoration: InputDecoration(hintText: 'Duration'))
          ],),),
     actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
        txtDescription.text='';
        txtDuration.text='';
      },
      child: Text('Cancel')),
      ElevatedButton(onPressed: saveSession, child: Text("Save"))
     ], 
     
     
     );
    });
  }
  Future saveSession() async{
    //reterive a current date and time
    DateTime now = DateTime.now(); 
    //can create a string contains values without closing it by adding dollar sign (strinf interpolation)
    String today='${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter()+1;
    Session newSession = Session(id, today, txtDescription.text, int.tryParse(txtDuration.text)??0);
    helper.writeSession(newSession).then((_){
      updateScreen();
      helper.setCounter();
    });
    txtDescription.text='';
    txtDuration.text='';
    Navigator.pop(context);

  }
  List<Widget>getContent(){
    List<Widget>tiles =[];
    sessions.forEach((session) { 
      tiles.add(Dismissible(key: UniqueKey(),onDismissed: (_){
        helper.deleteSession(session.id).then((value) => updateScreen());
      },
        child: ListTile(title: Text(session.description),
        subtitle: Text('${session.date}-duration:${session.duration} min'
        ),),
      ));
    });
    return tiles;
  }
  void updateScreen(){
    sessions=helper.getSessions();
    setState(() {});
      
    }
  }
