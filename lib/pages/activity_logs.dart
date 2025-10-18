import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/data/activity_logs.dart';
import 'package:jawara/shared/table.dart';

class ActivityLogsPage extends StatefulWidget {
  const ActivityLogsPage({super.key});
  @override
  State<ActivityLogsPage> createState() => _ActivityLogsPageState();
}

class _ActivityLogsPageState extends State<ActivityLogsPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;
    final headers = ['NO', 'DESKRIPSI', 'AKTOR', 'TANGGAL'];
    final sortable = ['DESKRIPSI', 'AKTOR', 'TANGGAL'];

    final rows = dummyActivityLogs.map((log) {
      return <Widget>[
        Text(log.id.toString()),
        Flexible(child: Text(log.description)),
        Text(log.actor),
        Text(DateFormat('d MMMM yyyy', 'id_ID').format(log.timestamp)),
      ];
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _isSidebarExpanded = !_isSidebarExpanded;
            });
          },
        ),
        title: const Text('Log Aktifitas'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
                size: 18,
              ),
              label: const Text('Filter', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A5AE0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(left: sidebarWidth),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
          ),
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}