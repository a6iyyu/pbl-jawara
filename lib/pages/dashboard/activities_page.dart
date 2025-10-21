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
                          color: Colors
                              .blue
                              .shade600, // Sesuaikan warna jika perlu
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1', // Data dari screenshot
                                  style: AppTheme.headingLarge.copyWith(
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Jumlah seluruh event yang sudah ada', // Teks dari screenshot
                                  style: AppTheme.bodyMedium.copyWith(
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
                            height: 200,
                            padding: const EdgeInsets.all(16),
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: const Color(0xFF06B6D4),
                                    value: 40,
                                    title: '40%',
                                    radius: 60,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: const Color(0xFF10B981),
                                    value: 30,
                                    title: '30%',
                                    radius: 60,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: const Color(0xFFF97316),
                                    value: 30,
                                    title: '30%',
                                    radius: 60,
                                    titleStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                                centerSpaceRadius: 40,
                                sectionsSpace: 2,
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
                            height: 150,
                            alignment: Alignment.center,
                            child: Text(
                              '[Placeholder Bar Chart]',
                              style: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.textLight,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
}
