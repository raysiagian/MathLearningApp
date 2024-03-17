import 'package:projectapp/models/question_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Level {
  final int id;
  final String number;
  final LevelType type;
  final List<Question> questions;
  final String content;
  final String videoUrl;

  Level({
    required this.id,
    required this.number,
    required this.type,
    this.questions = const [],
    this.content = '',
    this.videoUrl = '',
  });

  get options => null;
  // : assert(type == LevelType.materi && content.isNotEmpty && videoUrl.isNotEmpty, 'Materi harus memiliki content dan videoUrl');

  Future<List<Level>> getLevelFromAPI() async {
    try {
      var url = Uri.parse("http://10.0.2.2:8000/api/getLevel");
      final response = await http.get(url, headers: {"Content-type": "application/json"});

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => Level.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load level from API (Status Code: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Error fetching levels: $e');
    }
  }

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json["id"] as int,
      number: json["number"] as String,
      type: _parseLevelType(json["type"] as String),
      questions: [],
    );
  }

  static LevelType _parseLevelType(String typeString) {
    switch (typeString) {
      case 'pretest':
        return LevelType.pretest;
      case 'materi':
        return LevelType.materi;
      case 'postTest':
        return LevelType.postTest;
      default:
        throw ArgumentError("Invalid LevelType: $typeString");
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'number': number,
    'type': type.toString().split('.').last,
    // 'questions': questions.map((question) => question.toJson()).toList(),
  };

  @override
  String toString() {
    return 'Level{id: $id, number: $number, type: $type}';
  }

  Future<String?> fetchVideoUrl() async {
    try {
      var url = Uri.parse("http://10.0.2.2:8000/api/getLevel");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> levels = responseData['data'];

        if (levels.isNotEmpty) {
          final firstLevel = levels.first as Map<String, dynamic>; // Cast to Map for type safety
          // final videoUrl = firstLevel["videoUrl"];
          final videoUrl = firstLevel["videoUrl"] ?? ""; 

          if (videoUrl != null && videoUrl is String) {
            return videoUrl;
          } else {
            throw Exception('Video URL is null or not a string');
          }
        } else {
          throw Exception('No data returned from API');
        }
      } else {
        throw Exception('Failed to load video URL from API (Status Code: ${response.statusCode})');
      }
    } catch (e) {
      print('Error fetching video URL: $e');
      return null;
    }
  }
}

enum LevelType {
  pretest,
  materi,
  postTest,
}
