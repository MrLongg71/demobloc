import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_demo/ui/home.dart';
import 'package:flutter_app_bloc_demo/ui/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/': (context) => SignIn(),
        '/home': (context) => Home(),
      },
    );
  }
}
