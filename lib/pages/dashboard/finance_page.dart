import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:jawara/shared/sidebar.dart';
import 'package:jawara/shared/card.dart';
import 'package:jawara/shared/theme.dart';

class DashboardFinancePage extends StatefulWidget {
  const DashboardFinancePage({super.key});

  @override
  State<DashboardFinancePage> createState() => _DashboardFinancePageState();
}

class _DashboardFinancePageState extends State<DashboardFinancePage> {
  bool _isSidebarExpanded = true;
  String _selectedYear = '2025';
  final List<String> _yearOptions = ['2025', '2024', '2023'];

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1000;

    int summaryCrossAxisCount = isMobile ? 1 : 3;
    int chartCrossAxisCount = isMobile ? 1 : (isTablet ? 1 : 2);

    double summaryAspectRatio = isMobile ? 2.5 : (isTablet ? 2.0 : 2.2);
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
          'Dashboard Keuangan',
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
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Ringkasan Keuangan',
                            style: AppTheme.headingSmall.copyWith(
                              color: AppTheme.textDark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppTheme.borderRadiusSmall,
                            border: Border.all(color: AppTheme.border),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedYear,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppTheme.textMedium,
                              ),
                              style: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.textDark,
                              ),
                              items: _yearOptions.map((String year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedYear = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
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
                          title: 'Total Pemasukan',
                          value: '50 jt',
                          icon: Icons.arrow_downward_rounded,
                          color: AppTheme.accentGreen, // Hijau untuk pemasukan
                        ),
                        _buildSummaryCard(
                          title: 'Total Pengeluaran',
                          value: '152.1 rb',
                          icon: Icons.arrow_upward_rounded,
                          color: AppTheme.accentRed, // Merah untuk pengeluaran
                        ),
                        _buildSummaryCard(
                          title: 'Jumlah Transaksi',
                          value: '7',
                          icon: Icons.receipt_long_rounded,
                          color:
                              AppTheme.accentOrange, // Oranye untuk transaksi
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
                          title: 'Pemasukan per Bulan',
                          icon: Icons.bar_chart_rounded,
                          color: AppTheme.primary,
                          chartPlaceholderText:
                              '[Placeholder Bar Chart Pemasukan]',
                        ),
                        _buildChartCard(
                          title: 'Pengeluaran per Bulan',
                          icon: Icons.bar_chart_rounded,
                          color: AppTheme.accentRed,
                          chartPlaceholderText:
                              '[Placeholder Bar Chart Pengeluaran]',
                        ),
                        _buildChartCard(
                          title: 'Pemasukan Berdasarkan Kategori',
                          icon: Icons.pie_chart_rounded,
                          color: AppTheme.accentOrange,
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Pemasukan]',
                        ),
                        _buildChartCard(
                          title: 'Pengeluaran Berdasarkan Kategori',
                          icon: Icons.pie_chart_rounded,
                          color: AppTheme.accentPurple,
                          chartPlaceholderText:
                              '[Placeholder Pie Chart Pengeluaran]',
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
      // Menggunakan SharedCard yang sudah ada
      title: title,
      icon: icon,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan value
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            // Agar teks tidak overflow
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTheme.headingLarge.copyWith(
                color: color,
              ), // Ukuran lebih besar
              maxLines: 1,
            ),
          ),
          // Tambahkan deskripsi jika perlu
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
    // Tentukan apakah chart ini adalah pie chart berdasarkan icon
    bool isPieChart = icon == Icons.pie_chart_rounded;

    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: isPieChart
            ? _buildPieChart(title)
            : Center(
                child: Text(
                  chartPlaceholderText,
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }

  // Helper Widget untuk Pie Chart
  Widget _buildPieChart(String title) {
    // Data dummy berdasarkan judul
    List<PieChartSectionData> sections;

    if (title.contains('Pemasukan')) {
      sections = [
        PieChartSectionData(
          color: const Color(0xFF06B6D4),
          value: 30,
          title: '60%',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFF10B981),
          value: 20,
          title: '40%',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      // Data untuk pengeluaran
      sections = [
        PieChartSectionData(
          color: const Color(0xFFEF4444),
          value: 15,
          title: '45%',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFF97316),
          value: 10,
          title: '30%',
          radius: 60,
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFFBBF24),
          value: 8,
          title: '25%',
          radius: 60,
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
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
