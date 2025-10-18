import 'package:flutter/material.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
        title: const Text('Jawara Pintar'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
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
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SharedCard(
                    title: 'Total Kegiatan',
                    icon: Icons.event_note,
                    color: Colors.blue,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        children: [
                          TextSpan(
                            text: '1\n',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: 'Jumlah seluruh event yang sudah ada'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SharedCard(
                    title: 'Kegiatan per Kategori',
                    icon: Icons.category_outlined,
                    color: Colors.green,
                    child: Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        '[Placeholder untuk Pie Chart]',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SharedCard(
                    title: 'Kegiatan berdasarkan Waktu',
                    icon: Icons.access_time_filled_outlined,
                    color: Colors.orange,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sudah Lewat: 1'),
                        SizedBox(height: 4),
                        Text('Hari ini: 0'),
                        SizedBox(height: 4),
                        Text('Akan Datang: 0'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SharedCard(
                    title: 'Penanggung Jawab Terbanyak',
                    icon: Icons.person_search_outlined,
                    color: Colors.purple,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pak', style: TextStyle(fontSize: 16)),
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SharedCard(
                    title: 'Kegiatan per Bulan (Tahun Ini)',
                    icon: Icons.bar_chart_outlined,
                    color: Colors.pink,
                    child: Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        '[Placeholder untuk Bar Chart]',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
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