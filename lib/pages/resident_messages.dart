import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jawara/data/messages.dart';
import 'package:jawara/models/message.dart';
import 'package:jawara/shared/base_layout.dart';
import 'package:jawara/shared/table.dart';

class CitizenMessagesPage extends StatefulWidget {
  const CitizenMessagesPage({super.key});

  @override
  State<CitizenMessagesPage> createState() => _CitizenMessagesPageState();
}

class _CitizenMessagesPageState extends State<CitizenMessagesPage> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    if (!_isLocaleInitialized) {
      return BaseLayout(
        title: 'Pesan Warga',
        child: Container(
          width: double.infinity,
          color: const Color(0xFFF4F7FC),
          child: const Center(
            child: CircularProgressIndicator(color: Color(0xFF0891B2)),
          ),
        ),
      );
    }

    final headers = [
      'NO',
      'PENGIRIM',
      'JUDUL',
      'STATUS',
      'TANGGAL DIBUAT',
      'AKSI',
    ];
    final sortable = ['PENGIRIM', 'JUDUL', 'STATUS', 'TANGGAL DIBUAT'];

    final rows = dummyCitizenMessages.map((message) {
      return <Widget>[
        Text(message.id.toString()),
        Text(message.senderName, overflow: TextOverflow.ellipsis),
        Text(message.title, overflow: TextOverflow.ellipsis),
        _buildStatusChip(message.status),
        Text(DateFormat('d MMMM yyyy', 'id_ID').format(message.createdAt)),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {},
          tooltip: 'Detail',
        ),
      ];
    }).toList();

    return BaseLayout(
      title: 'Pesan Warga',
      actions: [
        Padding(
          padding: EdgeInsets.only(right: isMobile ? 8.0 : 16.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
              size: isMobile ? 16 : 20,
            ),
            label: Text(
              isMobile ? '' : 'Filter',
              style: const TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0891B2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 8 : 12,
              ),
            ),
          ),
        ),
      ],
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF4F7FC),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
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
      ),
    );
  }
}
