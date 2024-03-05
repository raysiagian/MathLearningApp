import 'package:projectapp/models/level.dart';

class Unit {
   final String id;
   final String title;
   final String explanation;
   final List<Level> levels; // Menambahkan levels sebagai List<LevelButton>

   Unit({
      required this.id,
      required this.title,
      required this.explanation,
      required this.levels, // Menginisialisasi levels
   });
}