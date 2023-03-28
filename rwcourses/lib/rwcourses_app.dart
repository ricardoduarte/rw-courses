import 'package:flutter/material.dart';
import 'package:rwcourses/strings.dart';
import 'package:rwcourses/ui/courses/courses_page.dart';
import 'package:rwcourses/ui/filter/filter_page.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.appTitle), actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () => Navigator.of(context).push<MaterialPageRoute>(
              MaterialPageRoute(builder: (_) => const FilterPage())),
        ),
      ]),
      body: const CoursesPage(),
    );
  }
}
