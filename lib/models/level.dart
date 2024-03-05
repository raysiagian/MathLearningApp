import 'package:projectapp/models/question_model.dart';

class Level {
  final String id;
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
}

enum LevelType {
  pretest,
  materi,
  postTest,
}
