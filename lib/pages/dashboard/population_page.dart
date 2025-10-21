import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/card.dart';
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

    double summaryAspectRatio = isMobile ? 3.0 : (isTablet ? 2.5 : 3.0);
    double chartAspectRatio = isMobile ? 1.3 : (isTablet ? 1.5 : 1.4);

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
                          value: '10', // Data
                          icon: Icons.family_restroom_rounded,
                          color: AppTheme.primary, // Biru
                        ),
                        _buildSummaryCard(
                          title: 'Total Penduduk',
                          value: '13', // Data
                          icon: Icons.people_alt_rounded,
                          color: AppTheme.accentGreen, // Hijau
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
                          icon: Icons.toggle_on_rounded, // Example icon
                          color: AppTheme.accentOrange, // Oranye
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Status]',
                        ),
                        _buildChartCard(
                          title: 'Jenis Kelamin',
                          icon: Icons.wc_rounded, // Example icon
                          color: AppTheme.primaryLight, // Biru muda
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Jenis Kelamin]',
                        ),
                        _buildChartCard(
                          title: 'Pekerjaan Penduduk',
                          icon: Icons.work_rounded, // Example icon
                          color: AppTheme.accentPurple, // Ungu
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Pekerjaan]',
                        ),
                        _buildChartCard(
                          title: 'Peran dalam Keluarga',
                          icon: Icons.group_work_rounded, // Example icon
                          color: AppTheme.secondary, // Biru langit
                          chartPlaceholderText: '[Placeholder Pie Chart Peran]',
                        ),
                        _buildChartCard(
                          title: 'Agama',
                          icon: Icons
                              .mosque_rounded, // Example icon (adjust as needed)
                          color: Colors.pink.shade400, // Merah muda
                          chartPlaceholderText: '[Placeholder Pie Chart Agama]',
                        ),
                        _buildChartCard(
                          title: 'Pendidikan',
                          icon: Icons.school_rounded, // Example icon
                          color: Colors.teal.shade400, // Teal
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Pendidikan]',
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
    required String chartPlaceholderText,
  }) {
    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: _buildPieChartByTitle(title, color),
      ),
    );
  }

  // Helper untuk membuat pie chart berdasarkan judul
  Widget _buildPieChartByTitle(String title, Color baseColor) {
    List<PieChartSectionData> sections;

    // Tentukan data berdasarkan judul chart
    if (title.contains('Status')) {
      sections = [
        PieChartSectionData(
          color: Colors.green.shade400,
          value: 80,
          title: '80%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.grey.shade400,
          value: 20,
          title: '20%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Jenis Kelamin')) {
      sections = [
        PieChartSectionData(
          color: Colors.blue.shade400,
          value: 52,
          title: '52%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.pink.shade400,
          value: 48,
          title: '48%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Pekerjaan')) {
      sections = [
        PieChartSectionData(
          color: const Color(0xFF8B5CF6),
          value: 35,
          title: '35%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFA78BFA),
          value: 30,
          title: '30%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFC4B5FD),
          value: 35,
          title: '35%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Peran')) {
      sections = [
        PieChartSectionData(
          color: const Color(0xFF06B6D4),
          value: 40,
          title: '40%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFF22D3EE),
          value: 35,
          title: '35%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFF67E8F9),
          value: 25,
          title: '25%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else if (title.contains('Agama')) {
      sections = [
        PieChartSectionData(
          color: Colors.pink.shade300,
          value: 70,
          title: '70%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.pink.shade500,
          value: 20,
          title: '20%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.pink.shade700,
          value: 10,
          title: '10%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      // Pendidikan
      sections = [
        PieChartSectionData(
          color: Colors.teal.shade300,
          value: 30,
          title: '30%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.teal.shade500,
          value: 40,
          title: '40%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.teal.shade700,
          value: 30,
          title: '30%',
          radius: 55,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    }

    return PieChart(
      PieChartData(
        sections: sections,
        centerSpaceRadius: 35,
        sectionsSpace: 2,
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
