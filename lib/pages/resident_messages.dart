import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jawara/data/messages.dart';
import 'package:jawara/models/message.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/table.dart';

class CitizenMessagesPage extends StatefulWidget {
  const CitizenMessagesPage({super.key});
  @override
  State<CitizenMessagesPage> createState() => _CitizenMessagesPageState();
}

class _CitizenMessagesPageState extends State<CitizenMessagesPage> {
  bool _isSidebarExpanded = true;

  Widget _buildStatusChip(Status status) {
    Color color;
    String label;
    switch (status) {
      case Status.accepted:
        color = Colors.green;
        label = 'Diterima';
        break;
      case Status.pending:
        color = Colors.orange;
        label = 'Pending';
        break;
    }

    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;
    final headers = ['NO', 'PENGIRIM', 'JUDUL', 'STATUS', 'TANGGAL DIBUAT', 'AKSI'];
    final sortable = ['PENGIRIM', 'JUDUL', 'STATUS', 'TANGGAL DIBUAT'];

    final rows = dummyCitizenMessages.map((message) {
      return <Widget>[
        Text(message.id.toString()),
        Text(message.senderName),
        Text(message.title),
        _buildStatusChip(message.status),
        Text(DateFormat('d MMMM yyyy', 'id_ID').format(message.createdAt)),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
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
        title: const Text('Pesan Warga'),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list, color: Colors.white),
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
          // Sidebar
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}