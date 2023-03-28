import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';

import 'repository.dart';

class CourseRepository implements Repository {
  String dataURL =
      'https://api.kodeco.com/api/contents?filter[content_types][]=collection';

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ';filter[domain_ids][]=$domainFilter';
    }

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;
    final data = apiResponse['data'] as List;
    for (final json in data) {
      courses.add(Course.fromJson(json as Map<String, dynamic>));
    }

    return courses;
  }
}
