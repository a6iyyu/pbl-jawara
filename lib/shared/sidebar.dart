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
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            // Header
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: widget.isExpanded ? 90 : 80,
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: widget.isExpanded ? 20 : 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF0891B2).withOpacity(0.05),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                ),
              ),
              child: widget.isExpanded
                  ? Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF0891B2), Color(0xFF0284C7)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0891B2).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.book_rounded,
                            color: Colors.white,
                            size: 28,
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
                                  color: Color(0xFF0891B2),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Sistem RT Modern',
                                style: TextStyle(
                                  color: const Color(0xFF6B7280),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0891B2), Color(0xFF0284C7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0891B2).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.book_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  // Dashboard
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.dashboard_rounded,
                      title: 'Dashboard',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('dashboard');
                        setState(
                          () => _isDashboardExpanded = !_isDashboardExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.account_balance_wallet_rounded,
                                  title: 'Keuangan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/dashboard/finance',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.event_note_rounded,
                                  title: 'Kegiatan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/dashboard/activities',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.people_alt_rounded,
                                  title: 'Kependudukan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/dashboard/population',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.dashboard_rounded,
                      title: 'Dashboard',
                      isExpanded: widget.isExpanded,
                      onTap: () =>
                          Navigator.pushNamed(context, '/dashboard/finance'),
                    ),

                  // Data Warga
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.people_rounded,
                      title: 'Data Warga & Rumah',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('residents');
                        setState(
                          () => _isResidentsExpanded = !_isResidentsExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.person_outline_rounded,
                                  title: 'Warga - Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/residents/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.person_add_rounded,
                                  title: 'Warga - Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/residents/add',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.family_restroom_rounded,
                                  title: 'Keluarga',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/families'),
                                ),
                                _MenuItem(
                                  icon: Icons.home_outlined,
                                  title: 'Rumah - Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/houses/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_home_rounded,
                                  title: 'Rumah - Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/houses/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.people_rounded,
                      title: 'Data Warga & Rumah',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/residents'),
                    ),

                  // Pemasukan
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.arrow_downward_rounded,
                      title: 'Pemasukan',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('income');
                        setState(() => _isIncomeExpanded = !_isIncomeExpanded);
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
                                _MenuItem(
                                  icon: Icons.category_rounded,
                                  title: 'Kategori Iuran',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/income/categories',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.request_quote_rounded,
                                  title: 'Tagih Iuran',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/income/bill',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.receipt_long_rounded,
                                  title: 'Tagihan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/income/bills',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.payments_outlined,
                                  title: 'Pemasukan Lain - Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/income/other/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_card_rounded,
                                  title: 'Pemasukan Lain - Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/income/other/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.arrow_downward_rounded,
                      title: 'Pemasukan',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/income'),
                    ),

                  // Pengeluaran
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.arrow_upward_rounded,
                      title: 'Pengeluaran',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('spending');
                        setState(
                          () => _isSpendingExpanded = !_isSpendingExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.list_alt_rounded,
                                  title: 'Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/spending/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_circle_outline_rounded,
                                  title: 'Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/spending/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.arrow_upward_rounded,
                      title: 'Pengeluaran',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/spending'),
                    ),

                  // Laporan Keuangan
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.description_rounded,
                      title: 'Laporan Keuangan',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('financialReport');
                        setState(
                          () => _isFinancialReportExpanded =
                              !_isFinancialReportExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.trending_down_rounded,
                                  title: 'Semua Pemasukan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/reports/income',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.trending_up_rounded,
                                  title: 'Semua Pengeluaran',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/reports/spending',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.print_rounded,
                                  title: 'Cetak Laporan',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/reports/print',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.description_rounded,
                      title: 'Laporan Keuangan',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/reports'),
                    ),

                  // Kegiatan & Broadcast
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.event_rounded,
                      title: 'Kegiatan & Broadcast',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('activities');
                        setState(
                          () => _isActivitiesExpanded = !_isActivitiesExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.event_note_rounded,
                                  title: 'Kegiatan - Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/activities/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.event_available_rounded,
                                  title: 'Kegiatan - Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/activities/add',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.campaign_outlined,
                                  title: 'Broadcast - Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/broadcast/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_alert_rounded,
                                  title: 'Broadcast - Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/broadcast/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.event_rounded,
                      title: 'Kegiatan & Broadcast',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/activities'),
                    ),

                  // Pesan Warga
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.chat_rounded,
                      title: 'Pesan Warga',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('messages');
                        setState(
                          () => _isMessagesExpanded = !_isMessagesExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.info_outline_rounded,
                                  title: 'Informasi Aspirasi',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/messages/aspirations',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.chat_rounded,
                      title: 'Pesan Warga',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/messages'),
                    ),

                  // Penerimaan Warga
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.person_add_rounded,
                      title: 'Penerimaan Warga',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('approval');
                        setState(
                          () => _isApprovalExpanded = !_isApprovalExpanded,
                        );
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
                                _MenuItem(
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
                    _MenuItem(
                      icon: Icons.person_add_rounded,
                      title: 'Penerimaan Warga',
                      isExpanded: widget.isExpanded,
                      onTap: () =>
                          Navigator.pushNamed(context, '/resident-approvals'),
                    ),

                  // Mutasi Keluarga
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.swap_horiz_rounded,
                      title: 'Mutasi Keluarga',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('familyMutation');
                        setState(
                          () => _isFamilyMutationExpanded =
                              !_isFamilyMutationExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.list_rounded,
                                  title: 'Daftar',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/family-mutations/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_rounded,
                                  title: 'Tambah',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/family-mutations/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.swap_horiz_rounded,
                      title: 'Mutasi Keluarga',
                      isExpanded: widget.isExpanded,
                      onTap: () =>
                          Navigator.pushNamed(context, '/family-mutations'),
                    ),

                  // Log Aktifitas
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.history_rounded,
                      title: 'Log Aktifitas',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('activityLog');
                        setState(
                          () =>
                              _isActivityLogExpanded = !_isActivityLogExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.format_list_bulleted_rounded,
                                  title: 'Semua Aktifitas',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/activity-logs',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.history_rounded,
                      title: 'Log Aktifitas',
                      isExpanded: widget.isExpanded,
                      onTap: () =>
                          Navigator.pushNamed(context, '/activity-logs'),
                    ),

                  // Manajemen Pengguna
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.settings_rounded,
                      title: 'Manajemen Pengguna',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('userManagement');
                        setState(
                          () => _isUserManagementExpanded =
                              !_isUserManagementExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.list_rounded,
                                  title: 'Daftar Pengguna',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/users'),
                                ),
                                _MenuItem(
                                  icon: Icons.person_add_alt_rounded,
                                  title: 'Tambah Pengguna',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/users/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.settings_rounded,
                      title: 'Manajemen Pengguna',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/users'),
                    ),

                  // Channel Transfer
                  if (widget.isExpanded) ...[
                    _MenuItem(
                      icon: Icons.sync_rounded,
                      title: 'Channel Transfer',
                      isExpanded: widget.isExpanded,
                      onTap: () {
                        _closeAllMenusExcept('channelTransfer');
                        setState(
                          () => _isChannelTransferExpanded =
                              !_isChannelTransferExpanded,
                        );
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
                                _MenuItem(
                                  icon: Icons.list_rounded,
                                  title: 'Daftar Channel',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/channels/list',
                                  ),
                                ),
                                _MenuItem(
                                  icon: Icons.add_rounded,
                                  title: 'Tambah Channel',
                                  isExpanded: widget.isExpanded,
                                  isSubMenuItem: true,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/channels/add',
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ] else
                    _MenuItem(
                      icon: Icons.sync_rounded,
                      title: 'Channel Transfer',
                      isExpanded: widget.isExpanded,
                      onTap: () => Navigator.pushNamed(context, '/channels'),
                    ),
                ],
              ),
            ),
            // Profile at bottom
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.15),
                    width: 1,
                  ),
                ),
              ),
              child: _MenuItem(
                icon: Icons.account_circle_rounded,
                title: 'Admin',
                subtitle: 'admin@jawara.id',
                isExpanded: widget.isExpanded,
                isProfile: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget MenuItem
class _MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isExpanded;
  final VoidCallback? onTap;
  final bool isProfile;
  final bool hasSubMenu;
  final bool isSubMenuExpanded;
  final bool isSubMenuItem;

  const _MenuItem({
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
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isProfile) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [
                    const Color(0xFF0891B2).withOpacity(0.1),
                    const Color(0xFF0284C7).withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF0891B2).withOpacity(_isHovered ? 0.3 : 0.1),
            width: 1,
          ),
        ),
        child: PopupMenuButton<String>(
          offset: const Offset(0, -60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, size: 18, color: Color(0xFF0891B2)),
                  SizedBox(width: 12),
                  Text('Profil', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, size: 18, color: Color(0xFF0891B2)),
                  SizedBox(width: 12),
                  Text('Pengaturan', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout, size: 18, color: Colors.red),
                  SizedBox(width: 12),
                  Text(
                    'Keluar',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'logout')
              Navigator.pushReplacementNamed(context, '/login');
          },
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0891B2), Color(0xFF0284C7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: Colors.white, size: 20),
              ),
              title: widget.isExpanded
                  ? Text(
                      widget.title,
                      style: const TextStyle(
                        color: Color(0xFF1F2937),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  : null,
              subtitle: widget.isExpanded && widget.subtitle != null
                  ? Text(
                      widget.subtitle!,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 11,
                      ),
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
            ),
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
          left: widget.isSubMenuItem ? 20 : 12,
          right: 12,
          top: 3,
          bottom: 3,
        ),
        decoration: BoxDecoration(
          gradient: _isHovered
              ? LinearGradient(
                  colors: [
                    const Color(0xFF0891B2).withOpacity(0.08),
                    const Color(0xFF0284C7).withOpacity(0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: _isHovered
                ? const Color(0xFF0891B2)
                : const Color(0xFF6B7280),
            size: widget.isSubMenuItem ? 18 : 22,
          ),
          title: widget.isExpanded
              ? Text(
                  widget.title,
                  style: TextStyle(
                    color: _isHovered
                        ? const Color(0xFF0891B2)
                        : const Color(0xFF1F2937),
                    fontWeight: widget.isSubMenuItem
                        ? FontWeight.w500
                        : FontWeight.w600,
                    fontSize: widget.isSubMenuItem ? 13 : 14,
                  ),
                )
              : null,
          trailing: widget.hasSubMenu && widget.isExpanded
              ? Icon(
                  widget.isSubMenuExpanded
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.chevron_right_rounded,
                  color: _isHovered
                      ? const Color(0xFF0891B2)
                      : const Color(0xFF6B7280),
                  size: 20,
                )
              : null,
          onTap: widget.onTap,
          contentPadding: EdgeInsets.symmetric(
            horizontal: widget.isSubMenuItem ? 16 : 14,
            vertical: 2,
          ),
        ),
      ),
    );
  }
}
