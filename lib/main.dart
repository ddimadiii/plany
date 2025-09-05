import 'package:flutter/material.dart';
import 'package:plany/controllers/bottomnav_controller.dart';
import 'package:plany/pages/add_todo_page.dart';
import 'package:plany/pages/history_page.dart';
import 'package:plany/pages/home_page.dart';
import 'package:plany/pages/login_page.dart';
import 'package:plany/pages/profile_page.dart';
import 'package:plany/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: AddTodoPage(),
    );
  }
}
