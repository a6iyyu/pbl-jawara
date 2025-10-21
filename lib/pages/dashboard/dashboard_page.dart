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
          icon: Icon(
            _isSidebarExpanded ? Icons.menu_open_rounded : Icons.menu_rounded,
            color: const Color(0xFF0891B2),
          ),
          onPressed: () {
            setState(() {
              _isSidebarExpanded = !_isSidebarExpanded;
            });
          },
        ),
        title: const Text('Jawara Pintar', overflow: TextOverflow.ellipsis),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color(0xFF1F2937),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_rounded,
              color: Color(0xFF0891B2),
            ),
            onPressed: () {},
            tooltip: 'Notifikasi',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: PopupMenuButton<String>(
              offset: const Offset(0, 50),
              onSelected: (value) {
                if (value == 'logout') {
                  // Navigasi ke halaman login
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'profile',
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_rounded,
                        color: Color(0xFF0891B2),
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Text('Profil', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_rounded,
                        color: Color(0xFF0891B2),
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Text('Pengaturan', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Keluar',
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              child: const CircleAvatar(
                backgroundColor: Color(0xFF0891B2),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 800;

                return SingleChildScrollView(
                  padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section dengan spacing lebih baik
                      Container(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selamat Datang! 👋',
                              style: TextStyle(
                                fontSize: isMobile ? 24 : 28,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1F2937),
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Ringkasan aktivitas hari ini',
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF6B7280),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Stats Grid dengan aspect ratio lebih baik
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: isMobile ? 1 : 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: isMobile ? 1.8 : 2.2,
                        children: [
                          _buildStatCard(
                            'Total Kegiatan',
                            '1',
                            'Event yang sudah ada',
                            Icons.event_note_rounded,
                            const Color(0xFF0891B2),
                          ),
                          _buildStatCard(
                            'Total Warga',
                            '3',
                            'Warga terdaftar',
                            Icons.people_rounded,
                            const Color(0xFF10B981),
                          ),
                          _buildStatCard(
                            'Penanggung Jawab',
                            'Pak',
                            'Paling aktif',
                            Icons.person_search_rounded,
                            const Color(0xFF8B5CF6),
                          ),
                          _buildStatCard(
                            'Menunggu Persetujuan',
                            '2',
                            'Pendaftar baru',
                            Icons.pending_actions_rounded,
                            const Color(0xFFEC4899),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Timeline Card dengan styling lebih baik
                      SharedCard(
                        title: 'Status Kegiatan',
                        icon: Icons.schedule_rounded,
                        color: const Color(0xFF0891B2),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: isMobile
                              ? Column(
                                  children: [
                                    _buildTimelineCard(
                                      'Sudah Lewat',
                                      '1',
                                      const Color(0xFF6B7280),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildTimelineCard(
                                      'Hari ini',
                                      '0',
                                      const Color(0xFF0891B2),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildTimelineCard(
                                      'Akan Datang',
                                      '0',
                                      const Color(0xFF3B82F6),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: _buildTimelineCard(
                                        'Sudah Lewat',
                                        '1',
                                        const Color(0xFF6B7280),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTimelineCard(
                                        'Hari ini',
                                        '0',
                                        const Color(0xFF0891B2),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _buildTimelineCard(
                                        'Akan Datang',
                                        '0',
                                        const Color(0xFF3B82F6),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
                letterSpacing: -1,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
