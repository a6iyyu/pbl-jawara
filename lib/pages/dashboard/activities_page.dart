import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/card.dart';
import 'package:jawara/shared/theme.dart';

class DashboardActivitiesPage extends StatefulWidget {
  const DashboardActivitiesPage({super.key});

  @override
  State<DashboardActivitiesPage> createState() =>
      _DashboardActivitiesPageState();
}

class _DashboardActivitiesPageState extends State<DashboardActivitiesPage> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    int chartCrossAxisCount = isMobile ? 1 : (isTablet ? 1 : 2);
    double chartAspectRatio = isMobile ? 1.5 : (isTablet ? 1.8 : 1.6);

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
          'Dashboard Kegiatan',
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
                      'Ringkasan Kegiatan Warga',
                      style: AppTheme.headingSmall.copyWith(
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Layout bisa menggunakan Column atau GridView seperti di Dashboard Finance
                    // Menggunakan GridView untuk konsistensi dan responsivitas
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          chartCrossAxisCount, // Gunakan variabel responsif
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio:
                          chartAspectRatio, // Gunakan variabel responsif

                      children: [
                        // Card "Total Kegiatan"
                        SharedCard(
                          title: 'Total Kegiatan',
                          icon: Icons.event_note_rounded,
                          color: Colors.blue.shade600,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: AppTheme.headingLarge.copyWith(
                                    color: Colors.blue.shade700,
                                    fontSize: 48,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Kegiatan "Musy" - Komunitas & Sosial',
                                  style: AppTheme.bodySmall.copyWith(
                                    color: AppTheme.textMedium,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Card "Kegiatan per Kategori"
                        SharedCard(
                          title: 'Kegiatan per Kategori',
                          icon: Icons.category_rounded,
                          color: Colors.green.shade600,
                          child: Container(
                            height: 250,
                            padding: const EdgeInsets.all(16),
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: const Color(0xFF10B981),
                                    value: 1,
                                    title: '100%',
                                    radius: 75,
                                    titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                                centerSpaceRadius: 45,
                                sectionsSpace: 0,
                                borderData: FlBorderData(show: false),
                              ),
                            ),
                          ),
                        ),

                        // Card "Kegiatan berdasarkan Waktu"
                        SharedCard(
                          title: 'Kegiatan berdasarkan Waktu',
                          icon: Icons.access_time_filled_rounded,
                          color: Colors.orange.shade600, // Sesuaikan warna
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sudah Lewat: 1'),
                                SizedBox(height: 6),
                                Text('Hari ini: 0'),
                                SizedBox(height: 6),
                                Text('Akan Datang: 0'),
                              ],
                            ),
                          ),
                        ),

                        // Card "Penanggung Jawab Terbanyak"
                        SharedCard(
                          title: 'Penanggung Jawab Terbanyak',
                          icon: Icons.person_search_rounded,
                          color: Colors.purple.shade600,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Pak',
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
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
                        ),

                        // Card "Kegiatan per Bulan (Tahun Ini)"
                        SharedCard(
                          title: 'Kegiatan per Bulan (Tahun Ini)',
                          icon: Icons.bar_chart_rounded,
                          color: Colors.pink.shade600,
                          child: Container(
                            height: 250,
                            padding: const EdgeInsets.all(16),
                            child: _buildActivitiesBarChart(),
                          ),
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

  // Helper Widget untuk Bar Chart Kegiatan
  Widget _buildActivitiesBarChart() {
    // Data dummy kegiatan per bulan (1 kegiatan di bulan tertentu)
    List<BarChartGroupData> barGroups = List.generate(12, (index) {
      double value = (index == 5) ? 1 : 0; // 1 kegiatan di bulan Juni (index 5)

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: Colors.pink.shade400,
            width: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
        ],
      );
    });

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 2,
        barGroups: barGroups,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'Mei',
                  'Jun',
                  'Jul',
                  'Agu',
                  'Sep',
                  'Okt',
                  'Nov',
                  'Des',
                ];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
