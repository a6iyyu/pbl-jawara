import 'package:flutter/material.dart';
import 'package:jawara/pages/dashboard_page.dart';
import 'package:jawara/pages/login.dart';
import 'package:jawara/pages/user_management.dart';

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/users': (context) => const UserManagementPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
