import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'models/user_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'input custom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF4B33B2),
        ),
        useMaterial3: true,
      ),
      home: WelcomeScreen(userData: userData),
    );
  }
}
