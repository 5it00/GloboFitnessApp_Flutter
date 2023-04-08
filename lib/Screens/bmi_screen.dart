import 'package:flutter/material.dart';
import 'package:my_app/shared/MenuBottom.dart';

import '../shared/menu_drawer.dart';
class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final double fontSize=20;
  String result = "";
  bool isMetric = true;
  bool isImperial = false; 
  //add texteditor controller for text field
  final TextEditingController txtHighet = TextEditingController();
  final TextEditingController txtWighet = TextEditingController();
  String HighetMesg='';
   String WighetMesg='';
  //error cuz no variable can be without value,so u can tell flutter to make it null with ? 
  double ?highet ;
  double ?wighet ;
  //which item are selected for this will add a list of boolean and to tell that i wouldnt leave 
  //it null will set it later 
  late List<bool> isSelected ;
  //inistate called once when widget called (insitalize non-final value  )
  @override
  void initState() {
    isSelected=[isMetric,isImperial];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    HighetMesg = 'please enter your highet in '+((isMetric ? 'meters':'inches'));
     WighetMesg = 'please enter your wighet in '+((isMetric ? 'kilos':'pounds'));
    return Scaffold(appBar: AppBar (title: Text('BMI Calculator')),
    //in odrder to add the drawer to our second screen and just set the drawer in scaffold
    drawer:MenuDrawer() ,
    bottomNavigationBar: MenuBottom(),
//to make user choose a value from small number of options use (Togglebutton) inner it use a list
//of widgets showing the choices can be icons , tags , imgs and then u set is select parameter
//which require a list of boolean that must conatin the same number of items as the number of 
//of children as the number of the togglebuttons and this tell which items are selected with a true
    //value and which are not .
    body: SingleChildScrollView(
      child: Column(children: [ToggleButtons
      (children: [Padding(padding:EdgeInsets.symmetric(horizontal: 16),
      child:Text('Metric', style: TextStyle(fontSize: fontSize)),
    ),
    Padding(padding:EdgeInsets.symmetric(horizontal: 16),
      child:Text('Imperial', style: TextStyle(fontSize: fontSize))),
    ],
    isSelected: isSelected,onPressed: toggleMeasure ),
    Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextField(controller: txtHighet ,keyboardType: TextInputType.number,
       decoration: InputDecoration(hintText: HighetMesg),),
    ),
    Padding(
      padding: const EdgeInsets.all(32.0),
      child: TextField(controller: txtWighet ,keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: WighetMesg),),
    ),
    ElevatedButton(onPressed:findBMI,child:Text('Calculate BMI',style: TextStyle(fontSize: fontSize))),
    Text(result,style: TextStyle(fontSize: fontSize))
      ],
      ),
    )
    );
  }
  void toggleMeasure(value){ //to make it occur u have to set values.
  if(value==0){
  isMetric=true;
  isImperial=false;
  }else{
    isMetric=false;
    isImperial=true;
  }
  //but still given a values doesnt mean this will make occur as specified .
  // so u must call setsate method.
  setState(() {
    //here update isSelected values  so will take the updates values.
    isSelected=[isMetric,isImperial];
  });
  }
  void findBMI(){
    double bmi = 0 ;
    double highet= double.tryParse(txtHighet.text)??0;
     double wighet= double.tryParse(txtWighet.text)??0;
     if(isMetric){
      bmi=wighet/(highet*highet );
     }else{
      bmi=wighet*703 /(highet*highet);
     }
     setState(() {
       result=("your BMI IS "+bmi.toStringAsFixed(2));
     });

  }
  }

 