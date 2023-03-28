import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/utils/string_extensions.dart';

import 'image_container.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;

  const CourseDetailsPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          _buildMain(context),
          _buildDetails(context),
          TextButton(
            onPressed: () => _launchCourse(course.courseId),
            child: const Text('View Course'),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'cardArtwork-${course.courseId}',
      child: ImageContainer(
        height: 200.0,
        url: course.artworkUrl,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 24.0),
          ),
          Text(
            course.description,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16.0);

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(course.contributors,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  void _launchCourse(String courseId) {
    launch('https://kodeco.com/$courseId');
  }
}
