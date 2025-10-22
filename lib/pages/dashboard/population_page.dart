import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jawara/shared/card.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/theme.dart';

class DashboardPopulationPage extends StatefulWidget {
  const DashboardPopulationPage({super.key});

  @override
  State<DashboardPopulationPage> createState() =>
      _DashboardPopulationPageState();
}

class _DashboardPopulationPageState extends State<DashboardPopulationPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

  int summaryCrossAxisCount = isMobile ? 1 : 2;
  int chartCrossAxisCount = isMobile ? 1 : (isTablet ? 1 : 2);

  double summaryAspectRatio = isMobile ? 2.2 : (isTablet ? 2.0 : 2.0);
  double chartAspectRatio = isMobile ? 1.25 : (isTablet ? 1.4 : 1.25);

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
        title: const Text(
          'Dashboard Kependudukan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ringkasan Kependudukan',
                      style: AppTheme.headingSmall.copyWith(
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Summary Cards Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: summaryCrossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: summaryAspectRatio,
                      children: [
                        _buildSummaryCard(
                          title: 'Total Keluarga',
                          value: '10',
                          icon: Icons.family_restroom_rounded,
                          color: AppTheme.primary,
                        ),
                        _buildSummaryCard(
                          title: 'Total Penduduk',
                          value: '12',
                          icon: Icons.people_alt_rounded,
                          color: AppTheme.accentGreen,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Charts Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: chartCrossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: chartAspectRatio,
                      children: [
                        _buildChartCard(
                          title: 'Status Penduduk',
                          icon: Icons.toggle_on_rounded,
                          color: AppTheme.accentOrange,
                        ),
                        _buildChartCard(
                          title: 'Jenis Kelamin',
                          icon: Icons.wc_rounded,
                          color: AppTheme.primaryLight,
                        ),
                        _buildChartCard(
                          title: 'Pekerjaan Penduduk',
                          icon: Icons.work_rounded,
                          color: AppTheme.accentPurple,
                        ),
                        _buildChartCard(
                          title: 'Peran dalam Keluarga',
                          icon: Icons.group_work_rounded,
                          color: AppTheme.secondary,
                        ),
                        _buildChartCard(
                          title: 'Agama',
                          icon: Icons.mosque_rounded,
                          color: Colors.pink.shade400,
                        ),
                        _buildChartCard(
                          title: 'Pendidikan',
                          icon: Icons.school_rounded,
                          color: Colors.teal.shade400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }

  // Helper Widget for Summary Cards
  Widget _buildSummaryCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTheme.headingLarge.copyWith(
                color: color,
                fontSize: 48,
              ), // Font lebih besar
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Chart Cards
  Widget _buildChartCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(16),
        child: _buildPieChartByTitle(title, color),
      ),
    );
  }

  // Helper untuk membuat pie chart berdasarkan judul
  Widget _buildPieChartByTitle(String title, Color baseColor) {
    List<PieChartSectionData> sections;

    // Data berdasarkan 12 penduduk aktual
    if (title.contains('Status')) {
      // Status Hidup: 11 Hidup, 1 Wafat
      sections = [
        PieChartSectionData(
          color: Colors.green.shade400,
          value: 11,
          title: '91.7%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.grey.shade400,
          value: 1,
          title: '8.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Jenis Kelamin')) {
      // 10 Laki-laki, 2 Perempuan
      sections = [
        PieChartSectionData(
          color: Colors.blue.shade400,
          value: 10,
          title: '83.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.pink.shade400,
          value: 2,
          title: '16.7%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Pekerjaan')) {
      // Contoh distribusi (data dummy realistis)
      sections = [
        PieChartSectionData(
          color: const Color(0xFF8B5CF6),
          value: 4,
          title: '33.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFA78BFA),
          value: 4,
          title: '33.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFC4B5FD),
          value: 4,
          title: '33.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Peran')) {
      // Peran: 10 Kepala Keluarga, 2 lainnya
      sections = [
        PieChartSectionData(
          color: const Color(0xFF06B6D4),
          value: 10,
          title: '83.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFF22D3EE),
          value: 2,
          title: '16.7%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Agama')) {
      // Mayoritas Islam (contoh)
      sections = [
        PieChartSectionData(
          color: Colors.pink.shade300,
          value: 10,
          title: '83.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.pink.shade500,
          value: 2,
          title: '16.7%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      // Pendidikan (contoh distribusi)
      sections = [
        PieChartSectionData(
          color: Colors.teal.shade300,
          value: 4,
          title: '33.3%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.teal.shade500,
          value: 5,
          title: '41.7%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.teal.shade700,
          value: 3,
          title: '25%',
          radius: 70,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    }

    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 45,
        sectionsSpace: 3,
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
