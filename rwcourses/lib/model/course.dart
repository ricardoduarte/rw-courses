class Course {
  final String courseId;
  final String name;
  final String description;
  final String difficulty;
  final String artworkUrl;
  final String contributors;

  Course(this.courseId, this.name, this.description, this.difficulty,
      this.artworkUrl, this.contributors);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        difficulty = json['attributes']['difficulty'] as String,
        artworkUrl = json['attributes']['card_artwork_url'] as String,
        contributors = json['attributes']['contributor_string'] as String;

  @override
  String toString() {
    return '$name: $difficulty';
  }
}
