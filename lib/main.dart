import 'package:flutter/material.dart';
import 'package:jawara/pages/dashboard.dart';
import 'package:jawara/pages/income.dart';
import 'package:jawara/pages/login.dart';
import 'package:jawara/pages/resident_approvals.dart';
import 'package:jawara/pages/spending.dart';
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
        '/dashboard': (context) => const DashboardPage(),
        '/income': (context) => const IncomePage(),
        '/login': (context) => const LoginPage(),
        '/resident-approvals': (context) => const ResidentApprovalsPage(),
        '/spending': (context) => const SpendingPage(),
        '/users': (context) => const UserManagementPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
