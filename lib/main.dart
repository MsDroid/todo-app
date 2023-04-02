import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.roboto().fontFamily
      ),
      home: const HomeScreen(),
    );
  }
}

