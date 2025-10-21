import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jawara/shared/base_layout.dart';
import 'package:jawara/data/activity_logs.dart';
import 'package:jawara/shared/table.dart';

class ActivityLogsPage extends StatefulWidget {
  const ActivityLogsPage({super.key});

  @override
  State<ActivityLogsPage> createState() => _ActivityLogsPageState();
}

class _ActivityLogsPageState extends State<ActivityLogsPage> {
  bool _isLocaleInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('id_ID', null);
    setState(() {
      _isLocaleInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocaleInitialized) {
      return const BaseLayout(
        title: 'Log Aktifitas',
        child: Center(
          child: CircularProgressIndicator(color: Color(0xFF0891B2)),
        ),
      );
    }

    final headers = ['NO', 'DESKRIPSI', 'AKTOR', 'TANGGAL'];
    final sortable = ['DESKRIPSI', 'AKTOR', 'TANGGAL'];

    final rows = dummyActivityLogs.map((log) {
      return <Widget>[
        Text(log.id.toString()),
        Flexible(child: Text(log.description, overflow: TextOverflow.ellipsis)),
        Text(log.actor, overflow: TextOverflow.ellipsis),
        Text(DateFormat('d MMM yyyy', 'id_ID').format(log.timestamp)),
      ];
    }).toList();

    return BaseLayout(
      title: 'Log Aktifitas',
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: Colors.white, size: 18),
            label: const Text('Filter', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0891B2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomDataTable(
                    headers: headers,
                    rows: rows,
                    sortable: sortable,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
