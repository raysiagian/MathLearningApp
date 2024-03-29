import 'package:projectapp/models/level.dart';
import 'package:projectapp/models/question_model.dart';
import 'package:projectapp/models/unit.dart';

class Materi {
  final List<Unit> units;
  final String title;
  final String imageCard;
  final String imageBackground;

  Materi({
    required this.units,
    required this.title,
    required this.imageCard,
    required this.imageBackground,
  });

  static final listMateri = [
    Materi(
        title: 'Penjumlahan',
        imageCard: 'assets/images/penjumlahan_card_backrgound.png',
        imageBackground: 'assets/images/penjumlahan_map_background.png',
        units: [
          //Unit 1
          Unit(
            id: '11',
            title: 'Unit 1',
            explanation: 'Penjumlahan Dasar dengan Gasing',
            levels: [
              Level(id: '111', number: '1', type: LevelType.pretest, questions: [
                Question(
                  id: '1111',
                  title: 'Berapakah 30 + 20 ?',
                  options: {'10': false, '30': false, '22': false, '50': true},
                ),
                Question(
                  id: '1112',
                  title: 'Berapakah 10 + 20 ?',
                  options: {'10': false, '30': true, '22': false, '50': false},
                ),
                Question(
                  id: '1113',
                  title: 'Berapakah 70 + 20 ?',
                  options: {'90': true, '30': false, '22': false, '50': false},
                ),
                Question(
                  id: '1114',
                  title: 'Berapakah 50 + 30 ?',
                  options: {'10': false, '30': false, '80': true, '50': false},
                ),
              ]),
              Level(
                id: '112',
                number: '2',
                type: LevelType.materi,
                videoUrl: 'https://www.youtube.com/watch?v=3n3w3v3',
                content:
                    'Penjumlahan adalah operasi matematika yang dilakukan untuk menambahkan dua atau lebih bilangan. Penjumlahan dilambangkan dengan tanda tambah (+).',
              ),
              Level(
                  id: '113',
                  number: '3',
                  type: LevelType.postTest,
                  questions: [
                    Question(
                      id: '1131',
                      title: 'Berapakah 30 + 20 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '22': false,
                        '50': true
                      },
                    ),
                    Question(
                      id: '1132',
                      title: 'Berapakah 10 + 20 ?',
                      options: {
                        '10': false,
                        '30': true,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '1133',
                      title: 'Berapakah 70 + 20 ?',
                      options: {
                        '90': true,
                        '30': false,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '1134',
                      title: 'Berapakah 50 + 30 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '80': true,
                        '50': false
                      },
                    ),
                  ]),
            ],
          ),
        ]),
    Materi(
        title: 'Pengurangan',
        imageCard: 'assets/images/pengurangan_card_backrgound.png',
        imageBackground: 'assets/images/pengurangan_map_background.png',
        units: [
          Unit(
            id: '21',
            title: 'Materi 1',
            explanation: 'Penjumlahan Dasar dengan Gasing',
            levels: [
              Level(id: '211', number: '1', type: LevelType.pretest, questions: [
                Question(
                  id: '2111',
                  title: 'Berapakah 30 + 20 ?',
                  options: {'10': false, '30': false, '22': false, '50': true},
                ),
                Question(
                  id: '2112',
                  title: 'Berapakah 10 + 20 ?',
                  options: {'10': false, '30': true, '22': false, '50': false},
                ),
                Question(
                  id: '2113',
                  title: 'Berapakah 70 + 20 ?',
                  options: {'90': true, '30': false, '22': false, '50': false},
                ),
                Question(
                  id: '2114',
                  title: 'Berapakah 50 + 30 ?',
                  options: {'10': false, '30': false, '80': true, '50': false},
                ),
              ]),
              Level(
                id: '212',
                number: '2',
                type: LevelType.materi,
                videoUrl: 'https://www.youtube.com/watch?v=3n3w3v3',
                content:
                    'Penjumlahan adalah operasi matematika yang dilakukan untuk menambahkan dua atau lebih bilangan. Penjumlahan dilambangkan dengan tanda tambah (+).',
              ),
              Level(
                  id: '213',
                  number: '2',
                  type: LevelType.postTest,
                  questions: [
                    Question(
                      id: '2131',
                      title: 'Berapakah 30 + 20 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '22': false,
                        '50': true
                      },
                    ),
                    Question(
                      id: '2132',
                      title: 'Berapakah 10 + 20 ?',
                      options: {
                        '10': false,
                        '30': true,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '2133',
                      title: 'Berapakah 70 + 20 ?',
                      options: {
                        '90': true,
                        '30': false,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '2134',
                      title: 'Berapakah 50 + 30 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '80': true,
                        '50': false
                      },
                    ),
                  ]),
            ],
          ),
        ]),
    Materi(
        title: 'Perkalian',
        imageCard: 'assets/images/perkalian_card_backrgound.png',
        imageBackground: 'assets/images/perkalian_map_background.png',
        units: [
          Unit(
            id: '31',
            title: 'Materi 1',
            explanation: 'Penjumlahan Dasar dengan Gasing',
            levels: [
              Level(id: '311', number: '1', type: LevelType.pretest, questions: [
                Question(
                  id: '3111',
                  title: 'Berapakah 30 + 20 ?',
                  options: {'10': false, '30': false, '22': false, '50': true},
                ),
                Question(
                  id: '3112',
                  title: 'Berapakah 10 + 20 ?',
                  options: {'10': false, '30': true, '22': false, '50': false},
                ),
                Question(
                  id: '3113',
                  title: 'Berapakah 70 + 20 ?',
                  options: {'90': true, '30': false, '22': false, '50': false},
                ),
                Question(
                  id: '3114',
                  title: 'Berapakah 50 + 30 ?',
                  options: {'10': false, '30': false, '80': true, '50': false},
                ),
              ]),
              Level(
                id: '312',
                number: '2',
                type: LevelType.materi,
                videoUrl: 'https://www.youtube.com/watch?v=3n3w3v3',
                content:
                    'Penjumlahan adalah operasi matematika yang dilakukan untuk menambahkan dua atau lebih bilangan. Penjumlahan dilambangkan dengan tanda tambah (+).',
              ),
              Level(
                  id: '313',
                  number: '2',
                  type: LevelType.postTest,
                  questions: [
                    Question(
                      id: '3131',
                      title: 'Berapakah 30 + 20 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '22': false,
                        '50': true
                      },
                    ),
                    Question(
                      id: '3132',
                      title: 'Berapakah 10 + 20 ?',
                      options: {
                        '10': false,
                        '30': true,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '3133',
                      title: 'Berapakah 70 + 20 ?',
                      options: {
                        '90': true,
                        '30': false,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '3134',
                      title: 'Berapakah 50 + 30 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '80': true,
                        '50': false
                      },
                    ),
                  ]),
            ],
          ),
        ]),
    Materi(
        title: 'Pembagian',
        imageCard: 'assets/images/pembagian_card_backrgound.png',
        imageBackground: 'assets/images/pembagian_map_background.png',
        units: [
          Unit(
            id: '41',
            title: 'Materi 1',
            explanation: 'Penjumlahan Dasar dengan Gasing',
            levels: [
              Level(id: '411', number: '1', type: LevelType.pretest, questions: [
                Question(
                  id: '4111',
                  title: 'Berapakah 30 + 20 ?',
                  options: {'10': false, '30': false, '22': false, '50': true},
                ),
                Question(
                  id: '4112',
                  title: 'Berapakah 10 + 20 ?',
                  options: {'10': false, '30': true, '22': false, '50': false},
                ),
                Question(
                  id: '4113',
                  title: 'Berapakah 70 + 20 ?',
                  options: {'90': true, '30': false, '22': false, '50': false},
                ),
                Question(
                  id: '4114',
                  title: 'Berapakah 50 + 30 ?',
                  options: {'10': false, '30': false, '80': true, '50': false},
                ),
              ]),
              Level(
                id: '412',
                number: '2',
                type: LevelType.materi,
                videoUrl: 'https://www.youtube.com/watch?v=3n3w3v3',
                content:
                    'Penjumlahan adalah operasi matematika yang dilakukan untuk menambahkan dua atau lebih bilangan. Penjumlahan dilambangkan dengan tanda tambah (+).',
              ),
              Level(
                  id: '413',
                  number: '2',
                  type: LevelType.postTest,
                  questions: [
                    Question(
                      id: '4131',
                      title: 'Berapakah 30 + 20 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '22': false,
                        '50': true
                      },
                    ),
                    Question(
                      id: '4132',
                      title: 'Berapakah 10 + 20 ?',
                      options: {
                        '10': false,
                        '30': true,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '4133',
                      title: 'Berapakah 70 + 20 ?',
                      options: {
                        '90': true,
                        '30': false,
                        '22': false,
                        '50': false
                      },
                    ),
                    Question(
                      id: '4134',
                      title: 'Berapakah 50 + 30 ?',
                      options: {
                        '10': false,
                        '30': false,
                        '80': true,
                        '50': false
                      },
                    ),
                  ]),
            ],
          ),
        ]),
  ];
}
