import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final bool isExpanded;
  const Sidebar({super.key, required this.isExpanded});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  // State untuk setiap menu yang memiliki sub-menu
  bool _isDashboardExpanded = false;
  bool _isResidentsExpanded = false;
  bool _isIncomeExpanded = false;
  bool _isSpendingExpanded = false;
  bool _isFinancialReportExpanded = false;
  bool _isActivitiesExpanded = false;
  bool _isMessagesExpanded = false;
  bool _isApprovalExpanded = false;
  bool _isFamilyMutationExpanded = false;
  bool _isActivityLogExpanded = false;
  bool _isUserManagementExpanded = false;
  bool _isChannelTransferExpanded = false;

  // Fungsi untuk menutup semua menu kecuali yang dipilih
  void _closeAllMenusExcept(String menuName) {
    setState(() {
      if (menuName != 'dashboard') _isDashboardExpanded = false;
      if (menuName != 'residents') _isResidentsExpanded = false;
      if (menuName != 'income') _isIncomeExpanded = false;
      if (menuName != 'spending') _isSpendingExpanded = false;
      if (menuName != 'financialReport') _isFinancialReportExpanded = false;
      if (menuName != 'activities') _isActivitiesExpanded = false;
      if (menuName != 'messages') _isMessagesExpanded = false;
      if (menuName != 'approval') _isApprovalExpanded = false;
      if (menuName != 'familyMutation') _isFamilyMutationExpanded = false;
      if (menuName != 'activityLog') _isActivityLogExpanded = false;
      if (menuName != 'userManagement') _isUserManagementExpanded = false;
      if (menuName != 'channelTransfer') _isChannelTransferExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: AnimatedContainer(
        width: widget.isExpanded ? 280.0 : 70.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0891B2), // cyan-600 - lebih soft
              Color(0xFF0284C7), // sky-600 - lebih soft
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _buildSidebarContent(context),
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Column(
      children: [
        // Header with Logo and Brand Name
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: widget.isExpanded ? 100 : 90,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: widget.isExpanded ? 20 : 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
          ),
          child: widget.isExpanded
              ? Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.book_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jawara Pintar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -0.3,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Sistem Manajemen RT Modern',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.book_rounded,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              // Dashboard dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.dashboard_rounded,
                  title: 'Dashboard',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('dashboard');
                    setState(() {
                      _isDashboardExpanded = !_isDashboardExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isDashboardExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isDashboardExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.account_balance_wallet_rounded,
                              title: 'Keuangan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/dashboard/finance',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.event_note_rounded,
                              title: 'Kegiatan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/dashboard/activities',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.people_alt_rounded,
                              title: 'Kependudukan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/dashboard/population',
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.dashboard_rounded,
                  title: 'Dashboard',
                  isExpanded: widget.isExpanded,
                  onTap: () => Navigator.pushNamed(context, '/dashboard'),
                ),

              // Data Warga & Rumah dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.people_rounded,
                  title: 'Data Warga & Rumah',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('residents');
                    setState(() {
                      _isResidentsExpanded = !_isResidentsExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isResidentsExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isResidentsExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.person_outline_rounded,
                              title: 'Warga - Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/residents/list');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.person_add_rounded,
                              title: 'Warga - Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/residents/add');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.family_restroom_rounded,
                              title: 'Keluarga',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/families');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.home_outlined,
                              title: 'Rumah - Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/houses/list');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_home_rounded,
                              title: 'Rumah - Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/houses/add');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.people_rounded,
                  title: 'Data Warga & Rumah',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/residents');
                  },
                ),

              // Pemasukan dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.arrow_downward_rounded,
                  title: 'Pemasukan',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('income');
                    setState(() {
                      _isIncomeExpanded = !_isIncomeExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isIncomeExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isIncomeExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.category_rounded,
                              title: 'Kategori Iuran',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/income/categories',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.request_quote_rounded,
                              title: 'Tagih Iuran',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/income/bill');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.receipt_long_rounded,
                              title: 'Tagihan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/income/bills');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.payments_outlined,
                              title: 'Pemasukan Lain - Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/income/other/list',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_card_rounded,
                              title: 'Pemasukan Lain - Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/income/other/add',
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.arrow_downward_rounded,
                  title: 'Pemasukan',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/income');
                  },
                ),

              // Pengeluaran dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.arrow_upward_rounded,
                  title: 'Pengeluaran',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('spending');
                    setState(() {
                      _isSpendingExpanded = !_isSpendingExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isSpendingExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isSpendingExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.list_alt_rounded,
                              title: 'Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/spending/list');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_circle_outline_rounded,
                              title: 'Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/spending/add');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.arrow_upward_rounded,
                  title: 'Pengeluaran',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/spending');
                  },
                ),

              // Laporan Keuangan dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.description_rounded,
                  title: 'Laporan Keuangan',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('financialReport');
                    setState(() {
                      _isFinancialReportExpanded = !_isFinancialReportExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isFinancialReportExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isFinancialReportExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.trending_down_rounded,
                              title: 'Semua Pemasukan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/reports/income');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.trending_up_rounded,
                              title: 'Semua Pengeluaran',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/reports/spending',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.print_rounded,
                              title: 'Cetak Laporan',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/reports/print');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.description_rounded,
                  title: 'Laporan Keuangan',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/reports');
                  },
                ),

              // Kegiatan & Broadcast dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.event_rounded,
                  title: 'Kegiatan & Broadcast',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('activities');
                    setState(() {
                      _isActivitiesExpanded = !_isActivitiesExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isActivitiesExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isActivitiesExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.event_note_rounded,
                              title: 'Kegiatan - Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/activities/list',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.event_available_rounded,
                              title: 'Kegiatan - Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/activities/add');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.campaign_outlined,
                              title: 'Broadcast - Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/broadcast/list');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_alert_rounded,
                              title: 'Broadcast - Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/broadcast/add');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.event_rounded,
                  title: 'Kegiatan & Broadcast',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/activities');
                  },
                ),

              // Pesan Warga dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.chat_rounded,
                  title: 'Pesan Warga',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('messages');
                    setState(() {
                      _isMessagesExpanded = !_isMessagesExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isMessagesExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isMessagesExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.info_outline_rounded,
                              title: 'Informasi Aspirasi',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/messages/aspirations',
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.chat_rounded,
                  title: 'Pesan Warga',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/messages');
                  },
                ),

              // Penerimaan Warga dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.person_add_rounded,
                  title: 'Penerimaan Warga',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('approval');
                    setState(() {
                      _isApprovalExpanded = !_isApprovalExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isApprovalExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isApprovalExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.how_to_reg_rounded,
                              title: 'Penerimaan Warga',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/resident-approvals',
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.person_add_rounded,
                  title: 'Penerimaan Warga',
                  isExpanded: widget.isExpanded,
                  onTap: () =>
                      Navigator.pushNamed(context, '/resident-approvals'),
                ),

              // Mutasi Keluarga dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.swap_horiz_rounded,
                  title: 'Mutasi Keluarga',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('familyMutation');
                    setState(() {
                      _isFamilyMutationExpanded = !_isFamilyMutationExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isFamilyMutationExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isFamilyMutationExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.list_rounded,
                              title: 'Daftar',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/family-mutations/list',
                                );
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_rounded,
                              title: 'Tambah',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/family-mutations/add',
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.swap_horiz_rounded,
                  title: 'Mutasi Keluarga',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/family-mutations');
                  },
                ),

              // Log Aktifitas dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Log Aktifitas',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('activityLog');
                    setState(() {
                      _isActivityLogExpanded = !_isActivityLogExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isActivityLogExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isActivityLogExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.format_list_bulleted_rounded,
                              title: 'Semua Aktifitas',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/activity-logs');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Log Aktifitas',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/activity-logs');
                  },
                ),

              // Manajemen Pengguna dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.settings_rounded,
                  title: 'Manajemen Pengguna',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('userManagement');
                    setState(() {
                      _isUserManagementExpanded = !_isUserManagementExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isUserManagementExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isUserManagementExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.list_rounded,
                              title: 'Daftar Pengguna',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/users');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.person_add_alt_rounded,
                              title: 'Tambah Pengguna',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/users/add');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.settings_rounded,
                  title: 'Manajemen Pengguna',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/users');
                  },
                ),

              // Channel Transfer dengan sub-menu
              if (widget.isExpanded) ...[
                _SidebarMenuItem(
                  icon: Icons.sync_rounded,
                  title: 'Channel Transfer',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    _closeAllMenusExcept('channelTransfer');
                    setState(() {
                      _isChannelTransferExpanded = !_isChannelTransferExpanded;
                    });
                  },
                  hasSubMenu: true,
                  isSubMenuExpanded: _isChannelTransferExpanded,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _isChannelTransferExpanded
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _SidebarMenuItem(
                              icon: Icons.list_rounded,
                              title: 'Daftar Channel',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/channels/list');
                              },
                            ),
                            _SidebarMenuItem(
                              icon: Icons.add_rounded,
                              title: 'Tambah Channel',
                              isExpanded: widget.isExpanded,
                              isSubMenuItem: true,
                              onTap: () {
                                Navigator.pushNamed(context, '/channels/add');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ] else
                _SidebarMenuItem(
                  icon: Icons.sync_rounded,
                  title: 'Channel Transfer',
                  isExpanded: widget.isExpanded,
                  onTap: () {
                    Navigator.pushNamed(context, '/channels');
                  },
                ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: _SidebarMenuItem(
              isProfile: true,
              icon: Icons.person_rounded,
              title: 'Admin Jawara',
              subtitle: 'admin1@gmail.com',
              isExpanded: widget.isExpanded,
            ),
          ),
        ),
      ],
    );
  }
}

// Widget untuk item menu, sekarang menjadi private class di file sidebar ini
class _SidebarMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isExpanded;
  final VoidCallback? onTap;
  final bool isProfile;
  final bool hasSubMenu;
  final bool isSubMenuExpanded;
  final bool isSubMenuItem;

  const _SidebarMenuItem({
    required this.icon,
    required this.title,
    required this.isExpanded,
    this.onTap,
    this.subtitle,
    this.isProfile = false,
    this.hasSubMenu = false,
    this.isSubMenuExpanded = false,
    this.isSubMenuItem = false,
  });

  @override
  State<_SidebarMenuItem> createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<_SidebarMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isProfile) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.12),
            width: 1,
          ),
        ),
        child: PopupMenuButton<String>(
          offset: const Offset(0, -150),
          color: Colors.white,
          elevation: 12,
          shadowColor: Colors.black.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          onSelected: (value) {
            if (value == 'profile') {
              // Navigasi ke profile (placeholder)
              debugPrint('Navigasi ke Profile');
            } else if (value == 'settings') {
              // Navigasi ke settings (placeholder)
              debugPrint('Navigasi ke Settings');
            } else if (value == 'logout') {
              // Logout dan kembali ke login
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
              height: 48,
              child: Row(
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: Color(0xFF0891B2),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Profil Saya',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'settings',
              height: 48,
              child: Row(
                children: [
                  Icon(
                    Icons.settings_rounded,
                    color: Color(0xFF0891B2),
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Pengaturan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const PopupMenuDivider(height: 1),
            const PopupMenuItem<String>(
              value: 'logout',
              height: 48,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(widget.icon, color: Colors.white, size: 20),
            ),
            title: widget.isExpanded
                ? Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            subtitle: widget.isExpanded && widget.subtitle != null
                ? Text(
                    widget.subtitle!,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      fontSize: 11,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            trailing: widget.isExpanded
                ? Icon(
                    Icons.more_vert,
                    color: Colors.white.withValues(alpha: 0.7),
                    size: 18,
                  )
                : null,
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(
          left: widget.isSubMenuItem ? 24 : 8,
          right: 8,
          top: 1,
          bottom: 1,
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: widget.isSubMenuItem
              ? Border(
                  left: BorderSide(
                    color: _isHovered
                        ? Colors.white.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.25),
                    width: 2,
                  ),
                )
              : null,
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.isSubMenuItem ? 10 : 12,
            vertical: widget.isSubMenuItem ? 2 : 4,
          ),
          minLeadingWidth: 20,
          leading: Icon(
            widget.icon,
            color: Colors.white.withValues(alpha: _isHovered ? 1.0 : 0.9),
            size: widget.isSubMenuItem ? 18 : 22,
          ),
          title: widget.isExpanded
              ? Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white.withValues(
                      alpha: _isHovered ? 1.0 : 0.95,
                    ),
                    fontWeight: widget.isSubMenuItem
                        ? FontWeight.w400
                        : FontWeight.w500,
                    fontSize: widget.isSubMenuItem ? 12.5 : 13.5,
                    letterSpacing: 0.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              : const SizedBox.shrink(),
          trailing: widget.isExpanded
              ? (widget.hasSubMenu
                    ? Icon(
                        widget.isSubMenuExpanded
                            ? Icons.expand_more_rounded
                            : Icons.chevron_right_rounded,
                        color: Colors.white.withValues(alpha: 0.7),
                        size: 20,
                      )
                    : (_isHovered && !widget.isSubMenuItem
                          ? Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white.withValues(alpha: 0.5),
                              size: 16,
                            )
                          : null))
              : null,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
