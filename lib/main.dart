import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/core/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:projectapp/firebase_options.dart';
// import 'package:projectapp/pages/home_wrapper/home_wrapper.dart';
// import 'package:projectapp/pages/onboardingpages.dart';
import 'package:projectapp/pages/onboardingpages.dart';
import 'package:projectapp/pages/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      // home: HomeWrapper()
      home: SplashScreen()
      // home: OnboardingPages()
    );
  }
}

