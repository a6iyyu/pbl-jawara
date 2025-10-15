import 'package:flutter/material.dart';
import '../shared/dashboard_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
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
      body: Row(
        children: [
          // --- SIDEBAR DENGAN KONTEN LENGKAP ---
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 280 : 70,
            color: Colors.white,
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.book_outlined,
                        color: Color(0xFF6A5AE0),
                        size: 40,
                      ),
                      if (_isSidebarExpanded) const SizedBox(width: 16),
                      if (_isSidebarExpanded)
                        const Flexible(
                          child: Text(
                            'Jawara Pintar.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      // Menggunakan _SidebarMenuItem helper untuk konsistensi
                      _SidebarMenuItem(
                        icon: Icons.dashboard_customize_outlined,
                        title: 'Dashboard',
                        isExpanded: _isSidebarExpanded,
                        subItems: const ['Keuangan'],
                      ),
                      _SidebarMenuItem(
                        icon: Icons.people_alt_outlined,
                        title: 'Data Warga & Rumah',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.trending_down_outlined,
                        title: 'Pemasukan',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.trending_up_outlined,
                        title: 'Pengeluaran',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.summarize_outlined,
                        title: 'Laporan Keuangan',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.campaign_outlined,
                        title: 'Kegiatan & Broadcast',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.chat_bubble_outline,
                        title: 'Pesan Warga',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.person_add_alt_1_outlined,
                        title: 'Penerimaan Warga',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.transfer_within_a_station_outlined,
                        title: 'Mutasi Keluarga',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.history_outlined,
                        title: 'Log Aktifitas',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.manage_accounts_outlined,
                        title: 'Manajemen Pengguna',
                        isExpanded: _isSidebarExpanded,
                      ),
                      _SidebarMenuItem(
                        icon: Icons.sync_alt_outlined,
                        title: 'Channel Transfer',
                        isExpanded: _isSidebarExpanded,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _SidebarMenuItem(
                    isProfile: true,
                    icon: Icons.person,
                    title: 'Admin Jawara',
                    subtitle: 'admin1@gmail.com',
                    isExpanded: _isSidebarExpanded,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1, thickness: 1),
          // --- KONTEN UTAMA DASHBOARD DENGAN DETAIL LENGKAP ---
          Expanded(
            child: SingleChildScrollView(
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
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
          ),
        ],
      ),
    );
  }
}

// Helper widget untuk item menu di sidebar
class _SidebarMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isExpanded;
  final VoidCallback? onTap;
  final List<String> subItems;
  final bool isProfile;

  const _SidebarMenuItem({
    required this.icon,
    required this.title,
    required this.isExpanded,
    this.onTap,
    this.subtitle,
    this.subItems = const [],
    this.isProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Jika ini adalah item profil
    if (isProfile) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        title: isExpanded ? Text(title) : null,
        subtitle: isExpanded ? Text(subtitle ?? '') : null,
        trailing: isExpanded ? const Icon(Icons.unfold_more) : null,
        onTap: onTap,
      );
    }

    // Jika punya sub-menu
    if (subItems.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(icon),
        title: isExpanded ? Text(title) : const SizedBox.shrink(),
        trailing: isExpanded
            ? const Icon(Icons.expand_more)
            : const SizedBox.shrink(),
        children: isExpanded
            ? subItems
                  .map(
                    (item) => ListTile(
                      title: Text(item),
                      contentPadding: const EdgeInsets.only(left: 30),
                      onTap: () {},
                    ),
                  )
                  .toList()
            : [],
      );
    }

    // Item menu biasa
    return ListTile(
      leading: Icon(icon),
      title: isExpanded ? Text(title) : const SizedBox.shrink(),
      trailing: isExpanded ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}
