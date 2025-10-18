import 'package:flutter/material.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/data/residents.dart';
import 'package:jawara/models/resident.dart';
import 'package:jawara/shared/table.dart';

class ResidentApprovalsPage extends StatefulWidget {
  const ResidentApprovalsPage({super.key});
  @override
  State<ResidentApprovalsPage> createState() => _ResidentApprovalsPageState();
}

class _ResidentApprovalsPageState extends State<ResidentApprovalsPage> {
  bool _isSidebarExpanded = true;

  Widget _buildStatusChip(RegistrationStatus status) {
    Color color;
    String label;
    switch (status) {
      case RegistrationStatus.accepted:
        color = Colors.green;
        label = 'Diterima';
        break;
      case RegistrationStatus.pending:
        color = Colors.orange;
        label = 'Pending';
        break;
      case RegistrationStatus.inactive:
        color = Colors.grey;
        label = 'Nonaktif';
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
    final headers = ['NO', 'NAMA', 'NIK', 'EMAIL', 'JENIS KELAMIN', 'FOTO IDENTITAS', 'STATUS REGISTRASI', 'AKSI'];
    final sortable = ['NAMA', 'EMAIL', 'STATUS REGISTRASI'];

    final rows = dummyResidents.map((resident) {
      return <Widget>[
        Text(resident.id.toString()),
        Text(resident.name),
        Text(resident.nik),
        Text(resident.email),
        Text(resident.gender),
        TextButton(onPressed: () {}, child: const Text('Lihat')),
        _buildStatusChip(resident.status),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
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
        title: const Text('Penerimaan Warga'),
        backgroundColor: Colors.white,
        elevation: 1,
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
                  padding: const EdgeInsets.all(16.0),
                  child: CustomDataTable(
                    headers: headers,
                    rows: rows,
                    sortable: sortable,
                  ),
                ),
              ),
            ),
          ),
          // Memanggil widget sidebar yang sudah dipisah
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}