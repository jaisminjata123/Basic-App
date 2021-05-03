
import 'package:flutter/material.dart';
import 'Dashboard.dart';
void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'Simple Login Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
         home:Dashboard(),
     
    );
  }
}
