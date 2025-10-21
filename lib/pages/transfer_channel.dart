import 'package:flutter/material.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/table.dart';

class TransferChannelPage extends StatefulWidget {
  const TransferChannelPage({super.key});

  @override
  State<TransferChannelPage> createState() => _TransferChannelPageState();
}

class _TransferChannelPageState extends State<TransferChannelPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;

    final headers = ['NO', 'NAMA', 'TIPE', 'A/N', 'THUMBNAIL', 'AKSI'];
    final sortable = ['NAMA', 'TIPE'];

    final rows = [
      [
        const Text('1'),
        const Text('QRIS Resmi RT 08'),
        const Text('qris'),
        const Text('RW 08 Karangploso'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: CircleAvatar(
            backgroundImage: const NetworkImage('https://placehold.co/100x100/003366/FFFFFF?text=JP'),
            radius: 20,
          ),
        ),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
      ],
      [
        const Text('2'),
        const Text('BCA'),
        const Text('bank'),
        const Text('jose'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: CircleAvatar(
            backgroundImage: const NetworkImage('https://placehold.co/100x100/E91E63/FFFFFF?text=J'),
            radius: 20,
          ),
        ),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
      ],
      [
        const Text('3'),
        const Text('234234'),
        const Text('ewallet'),
        const Text('23234'),
        const Text('-'),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
      ],
      [
        const Text('4'),
        const Text('Transfer via BCA'),
        const Text('bank'),
        const Text('RT Jawara Karangploso'),
        const Text('-'),
        IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
      ],
    ];

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
        title: const Flexible(
          child: Text(
            'Kanal Transfer',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Stack(
        children: [
          // KONTEN UTAMA – FULL WIDTH & HEIGHT
          AnimatedPadding(
            padding: EdgeInsets.only(left: sidebarWidth),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFF4F7FC),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16), // Padding seragam
              child: Column(
                children: [
                  // CARD TABEL – FULL WIDTH & HEIGHT
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CustomDataTable(
                          headers: headers,
                          rows: rows,
                          sortable: sortable,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // PAGINATION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(icon: const Icon(Icons.chevron_left), onPressed: () {}),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.chevron_right), onPressed: () {}),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // SIDEBAR
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}