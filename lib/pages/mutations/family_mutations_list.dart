import 'package:flutter/material.dart';
import 'package:jawara/data/mutations.dart';
import 'package:jawara/models/mutations.dart';
import 'package:jawara/shared/base_layout.dart';
import 'family_mutations_detail.dart';

class FamilyMutationsListPage extends StatefulWidget {
  const FamilyMutationsListPage({super.key});

  @override
  State<FamilyMutationsListPage> createState() => _FamilyMutationsListPageState();
}

class _FamilyMutationsListPageState extends State<FamilyMutationsListPage> {
  final List<Mutation> _data = mutationList;

  Widget _buildStatusChip(String jenisMutasi) {
    Color color;
    Color textColor;
    
    if (jenisMutasi.contains('Keluar')) {
      color = const Color(0xFFFEE2E2); 
      textColor = const Color(0xFFEF4444); 
    } else if (jenisMutasi.contains('Pindah')) {
      color = const Color(0xFFD1FAE5); 
      textColor = const Color(0xFF047857); 
    } else {
      color = const Color(0xFFE5E7EB);
      textColor = const Color(0xFF4B5563);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        jenisMutasi,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildActionMenu(BuildContext context, Mutation mutation) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: Colors.black54), // Ikon titik 3
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onSelected: (String result) {
        if (result == 'detail') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FamilyMutationsDetailPage(mutation: mutation),
            ),
          );
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'detail',
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: Color(0xFF0891B2)),
              SizedBox(width: 8),
              Text('Detail', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return BaseLayout(
      title: 'Daftar Mutasi Keluarga',
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF4F7FC),
        padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
        child: Column(
          children: [
            // JUDUL
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daftar Mutasi Keluarga",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 16 : 20),

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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "TANGGAL",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "KELUARGA",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "JENIS MUTASI",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "AKSI",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: mutationList.map((mutation) {
                              final isKeluar =
                                  mutation.jenisMutasi == 'Keluar Wilayah';
                              return DataRow(
                                cells: [
                                  DataCell(Text(mutation.id.toString())),
                                  DataCell(Text(mutation.tanggal)),
                                  DataCell(Text(mutation.keluarga)),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isKeluar
                                            ? Colors.red.shade100
                                            : Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        mutation.jenisMutasi,
                                        style: TextStyle(
                                          color: isKeluar
                                              ? Colors.red.shade700
                                              : Colors.green.shade700,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
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

            SizedBox(height: isMobile ? 12 : 16),
          ],
        ),
      ),
    );
  }
}
        ),
=======
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
            'Daftar Mutasi Keluarga',
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Daftar Mutasi Keluarga",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                    const Color(0xFF0891B2).withOpacity(0.06),
                                  ),
                                  border: TableBorder.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                  columns: const [
                                    DataColumn(label: Text("NO", style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataColumn(label: Text("TANGGAL", style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataColumn(label: Text("KELUARGA", style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataColumn(label: Text("JENIS MUTASI", style: TextStyle(fontWeight: FontWeight.bold))),
                                    DataColumn(label: Text("AKSI", style: TextStyle(fontWeight: FontWeight.bold))), 
                                  ],
                                  rows: _data.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final mutation = entry.value;
                                    return DataRow(
                                      color: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                        return index.isEven ? Colors.grey[50]! : Colors.white;
                                      }),
                                      cells: [
                                        DataCell(Text((index + 1).toString())),
                                        DataCell(Text(mutation.tanggal)),
                                        DataCell(Text(mutation.keluarga)),
                                        DataCell(_buildStatusChip(mutation.jenisMutasi)),
                                        DataCell(_buildActionMenu(context, mutation)), 
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
                          color: Theme.of(context).primaryColor, 
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
          // SIDEBAR
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
>>>>>>> 0cc652e069531f7c1680dbe02c031d5b5f54d981
      ),
    );
  }
}