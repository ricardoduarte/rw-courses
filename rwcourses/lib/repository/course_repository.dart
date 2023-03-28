import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';

import 'repository.dart';

class CourseRepository implements Repository {
  String dataURL =
      'https://api.raywanderlich.com/api/contents?filter[content_types][]=collection';

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ';filter[domain_ids][]=$domainFilter';
    }

    return courses;
  }
}
