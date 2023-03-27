import 'package:flutter/material.dart';
import 'package:rwcourses/strings.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
    );
  }
}