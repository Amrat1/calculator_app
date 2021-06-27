import 'package:caculator_todo_by_saylani/home.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
    class MyApp extends StatelessWidget {
      Widget build(BuildContext context) {
        return MaterialApp(home: Scaffold(body:Calculator(),),);
      }
    }
    //listView.builder() it takes all data from list and it takes itembuilder
//itemcount: list ki jo length ha wo batae ga