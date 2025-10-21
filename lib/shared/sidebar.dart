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
              _SidebarMenuItem(
                icon: Icons.dashboard_rounded,
                title: 'Dashboard',
                isExpanded: isExpanded,
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/dashboard'),
              ),
              _SidebarMenuItem(
                icon: Icons.people_rounded,
                title: 'Data Warga & Rumah',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.arrow_downward_rounded,
                title: 'Pemasukan',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.arrow_upward_rounded,
                title: 'Pengeluaran',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.description_rounded,
                title: 'Laporan Keuangan',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.event_rounded,
                title: 'Kegiatan & Broadcast',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.chat_rounded,
                title: 'Pesan Warga',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.person_add_rounded,
                title: 'Penerimaan Warga',
                isExpanded: isExpanded,
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  '/resident-approvals',
                ),
              ),
              _SidebarMenuItem(
                icon: Icons.swap_horiz_rounded,
                title: 'Mutasi Keluarga',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.history_rounded,
                title: 'Log Aktifitas',
                isExpanded: isExpanded,
              ),
              _SidebarMenuItem(
                icon: Icons.settings_rounded,
                title: 'Manajemen Pengguna',
                isExpanded: isExpanded,
                onTap: () {
                  Navigator.pushNamed(context, '/users');
                },
              ),
              _SidebarMenuItem(
                icon: Icons.sync_rounded,
                title: 'Channel Transfer',
                isExpanded: isExpanded,
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

// Widget untuk item menu yang dapat memiliki sub-item
class _SidebarMenuWithSubitems extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isExpanded;
  final List<Widget> subItems;

  const _SidebarMenuWithSubitems({
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.subItems,
  });

  @override
  State<_SidebarMenuWithSubitems> createState() =>
      _SidebarMenuWithSubitemsState();
}

class _SidebarMenuWithSubitemsState extends State<_SidebarMenuWithSubitems> {
  bool _isMenuOpen = false;
  bool _isHovered = false;

  @override
  void didUpdateWidget(_SidebarMenuWithSubitems oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Tutup submenus jika sidebar utama menyempit
    if (widget.isExpanded == false && oldWidget.isExpanded == true) {
      _isMenuOpen = false;
    }
  }

  void _toggleMenu() {
    if (widget.isExpanded) {
      setState(() {
        _isMenuOpen = !_isMenuOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Menu Utama
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _isHovered
                  ? Colors.white.withOpacity(0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(widget.icon, color: Colors.white, size: 24),
              title: widget.isExpanded
                  ? Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )
                  : const SizedBox.shrink(),
              trailing: widget.isExpanded
                  ? Icon(
                _isMenuOpen
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.chevron_right,
                color: Colors.white,
                size: 20,
              )
                  : null,
              onTap: _toggleMenu,
            ),
          ),
        ),
        // Sub-menu Items (hanya ditampilkan jika sidebar dan menu terbuka)
        if (widget.isExpanded && _isMenuOpen)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.subItems,
            ),
          ),
      ],
    );
  }
}

// Widget untuk menampilkan Sub-item (list item di bawah menu utama)
class _SidebarSubMenuItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isParentExpanded;

  const _SidebarSubMenuItem({
    required this.title,
    this.onTap,
    required this.isParentExpanded,
  });

  @override
  State<_SidebarSubMenuItem> createState() => _SidebarSubMenuItemState();
}

class _SidebarSubMenuItemState extends State<_SidebarSubMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (!widget.isParentExpanded) return const SizedBox.shrink();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          // Indentasi untuk submenu
          margin: const EdgeInsets.only(left: 36, right: 8, top: 2, bottom: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
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