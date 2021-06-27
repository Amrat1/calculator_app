import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  var result='';
  Widget btn(var textt){
    return Container(margin: EdgeInsets.all(10),
      height: 60,
      width: 60,
      child:FlatButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: (){
      setState(() {
        result= result+textt;
      });
    },
          color: Colors.blueAccent,
        child: Text(textt,style: TextStyle(
            fontSize: 24.0,fontWeight: FontWeight.bold),)));
  }
  clearr(){
    setState(() {
      result='';
    });
  }

  output(){
    Parser p=Parser();
    Expression exp= p.parse(result);
    ContextModel cm= ContextModel();
    double eval=exp.evaluate(EvaluationType.REAL,cm);
    setState(() {
      result =eval.toString();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF283637),
      appBar: AppBar(title: Center(child: Text('Calculator')),),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        children: [Container(padding: EdgeInsets.only(right: 26),
      child:
      Text(result,style:
      TextStyle(color: Color(0xFF545F61),fontSize: 24,fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(1, 1),
    ),
        Container(padding: EdgeInsets.only(right: 26),
          child:
        Text(result,style:
        TextStyle(color: Colors.white,fontSize: 48,fontWeight: FontWeight.bold),
        ),
        alignment: Alignment(1, 1),
        ),

        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 65,
              width: 65,
              child: FlatButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  onPressed: clearr, color: Colors.white,child: Text('C',style: TextStyle(fontSize: 28),)),
            ),
          btn('%'),
            btn('^'),
            btn('/')

        ],),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn('7'),
          btn('8'),
          btn('9'),
            btn('*'),

        ],),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn('4'),
            btn('5'),
          btn('6'),
            btn('-')
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btn('1'),
            btn('2'),
            btn('3'),
            btn('+')
        ],),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('00'),
              btn('0'),
              btn('.'),
              SizedBox(height: 65,
                width: 65,
                child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onPressed: output,color: Colors.white, child: Text('=',style: TextStyle(fontSize: 28),)),
              )
            ],),

      ],),
    );
  }
}

