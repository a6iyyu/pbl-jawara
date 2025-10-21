import 'package:flutter/material.dart';
import 'package:jawara/data/channels.dart';
import 'package:jawara/shared/sidebar.dart';

class ChannelsListPage extends StatefulWidget {
  const ChannelsListPage({super.key});

  @override
  State<ChannelsListPage> createState() => _ChannelsListPageState();
}

class _ChannelsListPageState extends State<ChannelsListPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;

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
            'Daftar Channel Transfer',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Stack(
        children: [
          // KONTEN UTAMA - FULL WIDTH & HEIGHT
          AnimatedPadding(
            padding: EdgeInsets.only(left: sidebarWidth),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFF4F7FC),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // JUDUL
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Daftar Channel Transfer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // CARD TABEL - FULL WIDTH & EXPANDED
                  Expanded(
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth,
                                ),
                                child: DataTable(
                                  headingRowHeight: 56,
                                  dataRowHeight: 64,
                                  columnSpacing: 32,
                                  headingRowColor: WidgetStateProperty.all(
                                    Colors.deepPurple.shade50,
                                  ),
                                  border: TableBorder.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                  columns: const [
                                    DataColumn(
                                      label: Text(
                                        "NO",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "NAMA CHANNEL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "TIPE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "ATAS NAMA",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "THUMBNAIL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "AKSI",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: channelList.map((channel) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text(channel.id.toString())),
                                        DataCell(Text(channel.nama)),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: channel.tipe == 'Bank'
                                                  ? Colors.blue.shade100
                                                  : channel.tipe == 'E-Wallet'
                                                  ? Colors.green.shade100
                                                  : Colors.orange.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              channel.tipe,
                                              style: TextStyle(
                                                color: channel.tipe == 'Bank'
                                                    ? Colors.blue.shade700
                                                    : channel.tipe == 'E-Wallet'
                                                    ? Colors.green.shade700
                                                    : Colors.orange.shade700,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataCell(Text(channel.atasNama)),
                                        DataCell(
                                          channel.thumbnail != null
                                              ? CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    channel.thumbnail!,
                                                  ),
                                                  radius: 20,
                                                )
                                              : const Icon(
                                                  Icons.image_not_supported,
                                                  color: Colors.grey,
                                                ),
                                        ),
                                        DataCell(
                                          IconButton(
                                            icon: const Icon(
                                              Icons.more_vert,
                                              color: Colors.black54,
                                            ),
                                            onPressed: () {},
                                            tooltip: 'Lihat detail',
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // PAGINATION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: () {},
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 193, 200, 202),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // SIDEBAR TETAP DI KIRI
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}
