import 'package:flutter/material.dart';
import 'package:jawara/pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jawara Pintar',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      initialRoute: 'login',
      routes: {'login': (context) => const LoginPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}