import 'package:flutter/material.dart';
import 'package:jawara/shared/dashboard_card.dart'; // Pastikan path ini benar

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      // --- SELURUH BAGIAN DRAWER DI-UPDATE DI SINI ---
      drawer: Drawer(
        child: Column(
          children: [
            // Header Drawer
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.book, color: Color(0xFF6A5AE0), size: 32),
                  SizedBox(width: 12),
                  Text(
                    'Jawara Pintar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items yang bisa di-scroll
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    isExpandable: false,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildMenuItem(
                    icon: Icons.people_alt_outlined,
                    title: 'Data Warga & Rumah',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.trending_down_outlined,
                    title: 'Pemasukan',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.trending_up_outlined,
                    title: 'Pengeluaran',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.summarize_outlined,
                    title: 'Laporan Keuangan',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.campaign_outlined,
                    title: 'Kegiatan & Broadcast',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.message_outlined,
                    title: 'Pesan Warga',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.person_add_alt_1_outlined,
                    title: 'Penerimaan Warga',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.transfer_within_a_station_outlined,
                    title: 'Mutasi Keluarga',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.history_outlined,
                    title: 'Log Aktifitas',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.manage_accounts_outlined,
                    title: 'Manajemen Pengguna',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                  _buildMenuItem(
                    icon: Icons.sync_alt_outlined,
                    title: 'Channel Transfer',
                    subItems: ['Sub Menu 1', 'Sub Menu 2'],
                  ),
                ],
              ),
            ),
            // Profile Section di bagian bawah
            const Divider(),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF6A5AE0),
                child: Text('A', style: TextStyle(color: Colors.white)),
              ),
              title: const Text('Admin Jawara'),
              subtitle: const Text('admin@gmail.com'),
              trailing: IconButton(
                icon: const Icon(Icons.unfold_more),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      // --- Bagian Body tidak berubah ---
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DashboardCard(
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
            DashboardCard(
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
            DashboardCard(
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
            DashboardCard(
              title: 'Penanggung Jawab Terbanyak',
              icon: Icons.person_search_outlined,
              color: Colors.purple,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pak', style: TextStyle(fontSize: 16)),
                  Text(
                    '1',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            DashboardCard(
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
    );
  }

  // Helper widget untuk membuat menu item lebih rapi dan reusable
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    List<String> subItems = const [],
    bool isExpandable = true,
    VoidCallback? onTap,
  }) {
    if (!isExpandable) {
      return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
    }
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(title),
      children: subItems
          .map(
            (subItem) => Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: ListTile(
                title: Text(subItem),
                onTap: () {
                  // Aksi untuk sub-menu
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
