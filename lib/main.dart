import 'package:flutter/material.dart';

// Import all pages using barrel files for better organization
import 'package:jawara/pages/auth/auth_pages.dart';
import 'package:jawara/pages/dashboard/dashboard_pages.dart';
import 'package:jawara/pages/residents/residents_pages.dart';
import 'package:jawara/pages/income/income_pages.dart';
import 'package:jawara/pages/spending/spending_pages.dart';
import 'package:jawara/pages/reports/reports_pages.dart';
import 'package:jawara/pages/activities/activities_pages.dart';
import 'package:jawara/pages/approvals/approvals_pages.dart';
import 'package:jawara/pages/mutations/mutations_pages.dart';
import 'package:jawara/pages/users/users_pages.dart';
import 'package:jawara/pages/channels/channels_pages.dart';
import 'package:jawara/pages/activity_logs_page.dart';

// Shared
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
        // Auth
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),

        // Dashboard
        '/dashboard': (context) => const DashboardPage(),
        '/dashboard/finance': (context) => const DashboardFinancePage(),
        '/dashboard/activities': (context) => const DashboardActivitiesPage(),
        '/dashboard/population': (context) => const DashboardPopulationPage(),

        // Data Warga & Rumah
        '/residents/list': (context) => const ResidentsListPage(),
        '/residents/add': (context) => const ResidentsAddPage(),
        '/families': (context) => const FamiliesPage(),
        '/houses/list': (context) => const HousesListPage(),
        '/houses/add': (context) => const HousesAddPage(),

        // Pemasukan (Income)
        '/income': (context) => const IncomePage(),
        '/income/categories': (context) => const IncomeCategoriesPage(),
        '/income/bill': (context) => const IncomeBillPage(),
        '/income/bills': (context) => const IncomeBillsPage(),
        '/income/other/list': (context) => const IncomeOtherListPage(),
        '/income/other/add': (context) => const IncomeOtherAddPage(),

        // Pengeluaran (Spending)
        '/spending': (context) => const SpendingPage(),
        '/spending/list': (context) => const SpendingListPage(),
        '/spending/add': (context) => const SpendingAddPage(),

        // Laporan Keuangan (Reports)
        '/reports/income': (context) => const ReportsIncomePage(),
        '/reports/spending': (context) => const ReportsSpendingPage(),
        '/reports/print': (context) => const ReportsPrintPage(),

        // Kegiatan & Broadcast
        '/activities/list': (context) => const ActivitiesListPage(),
        '/activities/add': (context) => const ActivitiesAddPage(),
        '/broadcast/list': (context) => const BroadcastListPage(),
        '/broadcast/add': (context) => const BroadcastAddPage(),

        // Pesan Warga (Resident Messages)
        '/messages': (context) => const CitizenMessagesPage(),
        '/messages/aspirations': (context) => const CitizenMessagesPage(),

        // Penerimaan Warga (Resident Approvals)
        '/resident-approvals': (context) => const ResidentApprovalsPage(),

        // Mutasi Keluarga (Family Mutations)
        '/family-mutations/list': (context) => const FamilyMutationsListPage(),
        '/family-mutations/add': (context) => const FamilyMutationsAddPage(),

        // Log Aktifitas (Activity Logs)
        '/activity-logs': (context) => const ActivityLogsPage(),

        // Manajemen Pengguna (User Management)
        '/users': (context) => const UserManagementPage(),
        '/users/add': (context) => const UsersAddPage(),

        // Channel Transfer
        '/channels/list': (context) => const ChannelsListPage(),
        '/channels/add': (context) => const ChannelsAddPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
