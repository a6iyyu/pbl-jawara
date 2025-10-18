import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isExpanded;
  const Sidebar({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: AnimatedContainer(
        width: isExpanded ? 280.0 : 70.0,
        color: Colors.white,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _buildSidebarContent(context),
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: isExpanded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.book_outlined,
                      color: Color(0xFF6A5AE0),
                      size: 40,
                    ),
                    const SizedBox(width: 16),
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
                )
              : const Center(
                  child: Icon(
                    Icons.book_outlined,
                    color: Color(0xFF6A5AE0),
                    size: 40,
                  ),
                ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _SidebarMenuItem(
                icon: Icons.dashboard_customize_outlined,
                title: 'Dashboard',
                isExpanded: isExpanded,
                onTap: () => Navigator.pushReplacementNamed(context, '/dashboard'),
                subItems: const ['Keuangan'],
              ),
              _SidebarMenuItem(
                icon: Icons.people_alt_outlined,
                title: 'Data Warga & Rumah',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.trending_down_outlined,
                title: 'Pemasukan',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.trending_up_outlined,
                title: 'Pengeluaran',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.summarize_outlined,
                title: 'Laporan Keuangan',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.campaign_outlined,
                title: 'Kegiatan & Broadcast',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.chat_bubble_outline,
                title: 'Pesan Warga',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.person_add_alt_1_outlined,
                title: 'Penerimaan Warga',
                isExpanded: isExpanded,
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  '/resident-approvals',
                ),
              ),
              _SidebarMenuItem(
                icon: Icons.transfer_within_a_station_outlined,
                title: 'Mutasi Keluarga',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.history_outlined,
                title: 'Log Aktifitas',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.manage_accounts_outlined,
                title: 'Manajemen Pengguna',
                isExpanded: isExpanded,
                onTap: () {
                  Navigator.pushNamed(context, '/users');
                },
              ),
              _SidebarMenuItem(
                icon: Icons.sync_alt_outlined,
                title: 'Channel Transfer',
                isExpanded: isExpanded,
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
            isExpanded: isExpanded,
          ),
        ),
      ],
    );
  }
}

// Widget untuk item menu, sekarang menjadi private class di file sidebar ini
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
    if (isProfile) {
      return ListTile(
        leading: CircleAvatar(backgroundColor: Colors.blue, child: Icon(icon, color: Colors.white)),
        title: isExpanded ? Text(title) : null,
        subtitle: isExpanded ? Text(subtitle ?? '') : null,
        trailing: isExpanded ? const Icon(Icons.unfold_more) : null,
        onTap: onTap,
      );
    }

    if (subItems.isNotEmpty) {
      return ExpansionTile(
        leading: Icon(icon),
        title: isExpanded ? Text(title) : const SizedBox.shrink(),
        trailing: isExpanded ? const Icon(Icons.expand_more) : const SizedBox.shrink(),
        children: isExpanded ? subItems.map((item) => ListTile(
          title: Text(item),
          contentPadding: const EdgeInsets.only(left: 30),
          onTap: () {},
        )).toList() : [],
      );
    }

    return ListTile(
      leading: Icon(icon),
      title: isExpanded ? Text(title) : const SizedBox.shrink(),
      trailing: isExpanded ? const Icon(Icons.chevron_right) : null,
      onTap: onTap,
    );
  }
}