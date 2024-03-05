import 'package:flutter/material.dart';

class Onboarding {
  final String imageOnboarding;
  final String title;
  final String explanation;

  Onboarding({
    required this.imageOnboarding,
    required this.title,
    required this.explanation,
  });

  static final listOnboarding = [
    Onboarding(
      imageOnboarding: 'assets/images/onboarding_image_page1.png', 
      title: 'Bermain dan Belajar', 
      explanation:'Belajar matematika dengan cara\nyang gampang, asik, dan menyenangkan',
    ),
    Onboarding(
      imageOnboarding: 'assets/images/onboarding_image_page2.png', 
      title: 'Naikkan Levelmu', 
      explanation: 'Sambut tantangan baru dan\ntingkatkan kemampuanmu!'
    ),
    Onboarding(
      imageOnboarding: 'assets/images/onboarding_image_page3.png', 
      title: 'Lihat Statistikmu', 
      explanation: 'Mulailah hari ini dengan semangat baru,\nlihatlah bagaimana kamu berkembang!',
    ),
  ];
}