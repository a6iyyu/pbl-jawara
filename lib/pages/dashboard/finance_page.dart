import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jawara/shared/card.dart';
import 'package:jawara/shared/sidebar.dart';
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


  double summaryAspectRatio = isMobile ? 2.2 : (isTablet ? 1.7 : 1.6);
  double chartAspectRatio = isMobile ? 1.35 : (isTablet ? 1.6 : 1.35);

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
                          value: 'Rp 5,01 M',
                          subtitle: 'Tagihan: Rp 100 rb + Lainnya: Rp 5 M',
                          icon: Icons.arrow_downward_rounded,
                          color: AppTheme.accentGreen,
                        ),
                        _buildSummaryCard(
                          title: 'Total Pengeluaran',
                          value: 'Rp 152,1 rb',
                          subtitle: '4 transaksi pengeluaran',
                          icon: Icons.arrow_upward_rounded,
                          color: AppTheme.accentRed,
                        ),
                        _buildSummaryCard(
                          title: 'Saldo',
                          value: 'Rp 4,86 M',
                          subtitle: 'Pemasukan - Pengeluaran',
                          icon: Icons.account_balance_wallet_rounded,
                          color: AppTheme.primary,
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
                          isBarChart: true,
                        ),
                        _buildChartCard(
                          title: 'Pengeluaran per Bulan',
                          icon: Icons.bar_chart_rounded,
                          color: AppTheme.accentRed,
                          isBarChart: true,
                        ),
                        _buildChartCard(
                          title: 'Pemasukan Berdasarkan Kategori',
                          icon: Icons.pie_chart_rounded,
                          color: AppTheme.accentOrange,
                          isBarChart: false,
                        ),
                        _buildChartCard(
                          title: 'Pengeluaran Berdasarkan Kategori',
                          icon: Icons.pie_chart_rounded,
                          color: AppTheme.accentPurple,
                          isBarChart: false,
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
    String? subtitle,
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
              style: AppTheme.headingLarge.copyWith(color: color, fontSize: 26),
              maxLines: 1,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.textMedium,
                fontSize: 11,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  // Helper Widget for Chart Cards
  Widget _buildChartCard({
    required String title,
    required IconData icon,
    required Color color,
    required bool isBarChart,
  }) {
    return SharedCard(
      title: title,
      icon: icon,
      color: color,
      child: Container(

        height: 220,
        padding: const EdgeInsets.all(16),
        child: isBarChart ? _buildBarChart(title) : _buildPieChart(title),
      ),
    );
  }

  // Helper Widget untuk Pie Chart
  Widget _buildPieChart(String title) {
    // Data berdasarkan data aktual di aplikasi
    List<PieChartSectionData> sections;

    if (title.contains('Pemasukan')) {
      // Data pemasukan: Tagihan (100rb) vs Lainnya (5M)
      sections = [
        PieChartSectionData(
          color: const Color(0xFF10B981),
          value: 5010700,
          title: '98%',
          radius: 75,
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFF34D399),
          value: 100000,
          title: '2%',
          radius: 75,
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      // Data pengeluaran berdasarkan kategori aktual
      sections = [
        PieChartSectionData(
          color: const Color(0xFFEF4444),
          value: 100100,
          title: '65.8%',
          radius: 75,
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFF97316),
          value: 51000,
          title: '33.5%',
          radius: 75,
          titleStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: const Color(0xFFFBBF24),
          value: 1000,
          title: '0.7%',
          radius: 75,
          titleStyle: const TextStyle(
            fontSize: 16,
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

  // Helper Widget untuk Bar Chart
  Widget _buildBarChart(String title) {
    bool isPemasukan = title.contains('Pemasukan');
    Color barColor = isPemasukan ? AppTheme.accentGreen : AppTheme.accentRed;

    // Data dummy untuk 12 bulan
    List<BarChartGroupData> barGroups = List.generate(12, (index) {
      double value;
      if (isPemasukan) {
        // Simulasi data pemasukan per bulan (dalam jutaan)
        value = (index % 3 == 0)
            ? 0.5
            : (index % 2 == 0)
            ? 0.3
            : 0.4;
      } else {
        // Simulasi data pengeluaran per bulan (dalam ratusan ribu)
        value = (index % 3 == 0)
            ? 0.15
            : (index % 2 == 0)
            ? 0.1
            : 0.12;
      }

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: barColor,
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
        maxY: isPemasukan ? 0.6 : 0.2,
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
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toStringAsFixed(1)}M',
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
          horizontalInterval: isPemasukan ? 0.1 : 0.05,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
