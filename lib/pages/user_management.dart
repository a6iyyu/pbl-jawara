import 'package:flutter/material.dart';
import 'package:jawara/shared/dashboard_card.dart';
import 'package:jawara/shared/input.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy users for UI
  final List<Map<String, String>> _users = [
    {'name': 'Andi Saputra', 'role': 'Admin', 'email': 'andi@mail.com'},
    {'name': 'Siti Aminah', 'role': 'Operator', 'email': 'siti@mail.com'},
    {'name': 'Budi Santoso', 'role': 'Viewer', 'email': 'budi@mail.com'},
  ];

  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _users.where((u) {
      final q = _query.toLowerCase();
      return u['name']!.toLowerCase().contains(q) ||
          u['email']!.toLowerCase().contains(q) ||
          u['role']!.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manajemen Pengguna'),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daftar Pengguna',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: implement add user dialog
                  },
                  icon: const Icon(Icons.person_add_alt_1_outlined),
                  label: const Text('Tambah Pengguna'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A5AE0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search field using shared input to match style
            CustomInputField(
              label: 'Cari Pengguna',
              hintText: 'Nama, email, atau role',
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Ketik untuk mencari...',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => setState(() => _query = ''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  child: const Icon(Icons.search),
                ),
              ],
            ),

            const SizedBox(height: 16),

            DashboardCard(
              title: 'Pengguna',
              icon: Icons.manage_accounts_outlined,
              color: const Color(0xFF6A5AE0),
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 400),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final user = filtered[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFF6A5AE0),
                            child: Text(user['name']!.substring(0, 1)),
                          ),
                          title: Text(user['name']!),
                          subtitle: Text('${user['role']} • ${user['email']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_outlined),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Pagination placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Menampilkan 1–3 dari 3 pengguna'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
