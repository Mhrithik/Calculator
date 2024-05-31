import 'package:flutter/material.dart';
void main (){
  runApp(firstapp());
}
class firstapp extends StatelessWidget {
  const firstapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: firstpage(),
    );
  }
}
class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String dtext ="";
  String text = "";
  int first = 0;
  int second = 0;
  String operator ="";

  void bclicked( String bText) {
    if (bText == "C") {
      text = "";
      dtext = "";
    }
    else if (bText == "+" || bText == "-" || bText == "x" || bText == "/") {
      first = int.parse(dtext);
      text = "";
      operator = bText;
    }
    else if (bText == "=") {
      second = int.parse(dtext);
      if (operator == "+"){
        text = (first + second).toString();
      }if (operator == "-"){
        text =(first-second).toString();
      }if (operator == "x"){
        text =(first * second).toString();
      }if (operator=="/") {
        text = (first / second).toString();
      }
    }

    else {
      text = dtext + bText ;
    }
    setState(() {
      dtext =text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(title: Text('calculator'),)),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child:Container(padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                dtext,
                style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),
              ),

            )),
            Row(children: [
              hirthicButton("9",Colors.grey,Colors.black),
              hirthicButton("8",Colors.grey,Colors.black54),
              hirthicButton("7",Colors.grey,Colors.blue),
              hirthicButton("+",Colors.grey,Colors.brown),
            ],),
            Row(children: [
              hirthicButton("6",Colors.grey,Colors.black),
              hirthicButton("5",Colors.grey,Colors.black54),
              hirthicButton("4",Colors.grey,Colors.blue),
              hirthicButton("-",Colors.grey,Colors.brown),
            ],),
            Row(children: [
              hirthicButton("3",Colors.grey,Colors.black),
              hirthicButton("2",Colors.grey,Colors.black54),
              hirthicButton("1",Colors.grey,Colors.blue),
              hirthicButton("x",Colors.grey,Colors.brown),
            ],),
            Row(children: [
              hirthicButton("C",Colors.grey,Colors.black),
              hirthicButton('0',Colors.grey,Colors.black54),
              hirthicButton('=',Colors.grey,Colors.blue),
              hirthicButton('/',Colors.grey,Colors.brown),
            ],)
          ],
        ),
      ),
    );

  }

  Expanded hirthicButton(String bvalue, Color color1,Color color2) {
    return Expanded(child: Container(margin: EdgeInsets.all(3),height: 60,
      child: ElevatedButton(
        style:ElevatedButton.styleFrom

          (onPrimary: Color(2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),

          ),
          elevation: 5,
          enableFeedback: true,
          primary: color1,
        ) ,
        onPressed: () => bclicked(bvalue),
        child:Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(bvalue,style: TextStyle(color: Colors.red,fontSize: 30),),
        ),
      ),
    ),
    );
  }
}


