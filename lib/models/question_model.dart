import 'dart:convert';
import 'package:http/http.dart' as http;

class Question {
  final int id;
  final String title;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      title: json['title'] as String,
      options: (json['options'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as bool)) ?? {},
    );
  }

  static Future<List<Question>> getQuestionFromAPI() async {
    try {
      var url = Uri.parse("http://10.0.2.2:8000/api/getQuestion");
      final response = await http.get(url, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Question.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load questions from API');
      }
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options)';
  }
}
