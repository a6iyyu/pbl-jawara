import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final bool isExpanded;
  const Sidebar({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: AnimatedContainer(
        width: isExpanded ? 280.0 : 70.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF06B6D4), Color(0xFF0EA5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF06B6D4).withValues(alpha: 0.3),
              blurRadius: 24,
              offset: const Offset(4, 0),
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
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
          child: isExpanded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.book_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Jawara Pintar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.book_rounded,
                      color: Colors.white,
                      size: 32,
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
              // Menu Item yang baru dengan Sub-menu
              _SidebarMenuWithSubitems(
                icon: Icons.event_rounded,
                title: 'Kegiatan & Broadcast',
                isExpanded: isExpanded,
                subItems: [
                  _SidebarSubMenuItem(
                    title: 'Kegiatan - Daftar',
                    onTap: () {
                      /* Navigasi ke Kegiatan Daftar */
                    },
                    isParentExpanded: isExpanded,
                  ),
                  _SidebarSubMenuItem(
                    title: 'Kegiatan - Tambah',
                    onTap: () {
                      /* Navigasi ke Kegiatan Tambah */
                    },
                    isParentExpanded: isExpanded,
                  ),
                  _SidebarSubMenuItem(
                    title: 'Broadcast - Daftar',
                    onTap: () {
                      /* Navigasi ke Broadcast Daftar */
                    },
                    isParentExpanded: isExpanded,
                  ),
                  _SidebarSubMenuItem(
                    title: 'Broadcast - Tambah',
                    onTap: () {
                      /* Navigasi ke Broadcast Tambah */
                    },
                    isParentExpanded: isExpanded,
                  ),
                ],
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
              // Menu Item Mutasi Keluarga (dengan Sub-menu BARU)
              _SidebarMenuWithSubitems(
                icon: Icons.swap_horiz_rounded,
                title: 'Mutasi Keluarga',
                isExpanded: isExpanded,
                subItems: [
                  _SidebarSubMenuItem(
                    title: 'Daftar',
                    onTap: () {
                      Navigator.pushNamed(context, '/mutations/daftar');
                    },
                    isParentExpanded: isExpanded,
                  ),
                  _SidebarSubMenuItem(
                    title: 'Tambah',
                    onTap: () {
                      Navigator.pushNamed(context, '/mutations/tambah');
                    },
                    isParentExpanded: isExpanded,
                  ),
                ],
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
              // Menu Item Channel Transfer (dengan Sub-menu BARU)
              _SidebarMenuWithSubitems(
                icon: Icons.sync_rounded,
                title: 'Channel Transfer',
                isExpanded: isExpanded,
                subItems: [
                  _SidebarSubMenuItem(
                    title: 'Daftar Channel',
                    onTap: () {
                  Navigator.pushNamed(context, '/transfer-channel/daftar');
                    },
                    isParentExpanded: isExpanded,
                  ),
                  _SidebarSubMenuItem(
                    title: 'Tambah Channel',
                    onTap: () {
                      Navigator.pushNamed(context, '/transfer-channel/tambah');
                    },
                    isParentExpanded: isExpanded,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.2),
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
              isExpanded: isExpanded,
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

  const _SidebarMenuItem({
    required this.icon,
    required this.title,
    required this.isExpanded,
    this.onTap,
    this.subtitle,
    this.isProfile = false,
  });

  @override
  State<_SidebarMenuItem> createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<_SidebarMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isProfile) {
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
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
                      fontSize: 14,
                    ),
                  )
                : null,
            subtitle: widget.isExpanded && widget.subtitle != null
                ? Text(
                    widget.subtitle!,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  )
                : null,
            trailing: widget.isExpanded
                ? const Icon(Icons.more_vert, color: Colors.white, size: 20)
                : null,
            onTap: widget.onTap,
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.white.withValues(alpha: 0.2)
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
          trailing: widget.isExpanded && _isHovered
              ? const Icon(Icons.chevron_right, color: Colors.white, size: 20)
              : null,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}