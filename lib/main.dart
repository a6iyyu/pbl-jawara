import 'package:flutter/material.dart';
import 'package:jawara/pages/dashboard.dart';
import 'package:jawara/pages/income.dart';
import 'package:jawara/pages/login.dart';
import 'package:jawara/pages/mutations.dart';
import 'package:jawara/pages/mutations_tambah.dart';
import 'package:jawara/pages/register.dart';
import 'package:jawara/pages/resident_approvals.dart';
import 'package:jawara/pages/spending.dart';
import 'package:jawara/pages/transfer_channel.dart';
import 'package:jawara/pages/transfer_channel_tambah.dart';
import 'package:jawara/pages/user_management.dart';
import 'package:jawara/shared/theme.dart';

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
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/income': (context) => const IncomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/resident-approvals': (context) => const ResidentApprovalsPage(),
        '/spending': (context) => const SpendingPage(),
        '/users': (context) => const UserManagementPage(),
        '/mutations/daftar': (context) => const MutationsPage(),
        '/mutations/tambah': (context) => const MutationsPageTambah(),
        '/transfer-channel/daftar': (context) => const TransferChannelPage(),
        '/transfer-channel/tambah': (context) => const TransferChannelPageTambah(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
