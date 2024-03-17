import 'dart:convert';
import 'package:http/http.dart' as http;

class Option {
  final int id;
  final int questionId;
  final String text;
  final bool isCorrect;

  Option({
    required this.id,
    required this.questionId,
    required this.text,
    required this.isCorrect,
  });

  Future<List<Option>> fetchOptions() async {
    try {
      var url = Uri.parse("http://10.0.2.2:8000/api/getOption");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Option.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load options from API');
      }
    } catch (e) {
      throw Exception('Error fetching options: $e');
    }
  }

    factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] as int,
      questionId: json['question_id'] as int,
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }
  
    Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,

  };

  @override
  String toString() {
    return 'Unit{id: $id, text: $text}';
  }

}
