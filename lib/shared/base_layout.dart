import 'package:flutter/material.dart';
import 'package:jawara/shared/sidebar.dart';

class BaseLayout extends StatefulWidget {
  final Widget child;
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;

  const BaseLayout({
    super.key,
    required this.child,
    required this.title,
    this.actions,
    this.showBackButton = true,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  bool _isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    final double sidebarWidth = _isSidebarExpanded ? 280.0 : 70.0;

    return Scaffold(
      appBar: AppBar(
        leading: widget.showBackButton
            ? IconButton(
                icon: Icon(
                  _isSidebarExpanded
                      ? Icons.menu_open_rounded
                      : Icons.menu_rounded,
                  color: const Color(0xFF0891B2),
                ),
                onPressed: () {
                  setState(() {
                    _isSidebarExpanded = !_isSidebarExpanded;
                  });
                },
              )
            : null,
        title: Text(widget.title, overflow: TextOverflow.ellipsis),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Color(0xFF1F2937),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions:
            widget.actions ??
            [
              IconButton(
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Color(0xFF0891B2),
                ),
                onPressed: () {},
                tooltip: 'Notifikasi',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 8),
                child: PopupMenuButton<String>(
                  offset: const Offset(0, 50),
                  onSelected: (value) {
                    if (value == 'logout') {
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Color(0xFF0891B2),
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text('Profil', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'settings',
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_rounded,
                            color: Color(0xFF0891B2),
                            size: 20,
                          ),
                          SizedBox(width: 12),
                          Text('Pengaturan', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                      value: 'logout',
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFF0891B2),
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
      ),
      body: Stack(
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(left: sidebarWidth),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: widget.child,
          ),
          Sidebar(isExpanded: _isSidebarExpanded),
        ],
      ),
    );
  }
}
