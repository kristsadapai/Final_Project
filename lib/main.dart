import 'package:Final_Project/Loginpage.dart';
import 'package:Final_Project/menu.dart';
import 'package:Final_Project/register.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:Final_Project/menu.dart';
import 'package:Final_Project/cart.dart';

Future<void> main() async{
  
  const fiveSeconds = const Duration(seconds: 1);
  Timer.periodic(fiveSeconds, (Timer t) => foodprice());
  Timer.periodic(fiveSeconds, (Timer t) => checkcart());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primaryColor: Colors.blue[900]),
    debugShowCheckedModeBanner: false,
      title: "GoTasty",
      home: Login(),
    );
  }
}

