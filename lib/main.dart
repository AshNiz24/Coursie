import 'package:flutter/material.dart';
import './screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffF56A4D),
        accentColor: Color(0xffF56A4D),
      ),
      home: HomeScreen(),
    ),
  );
}
