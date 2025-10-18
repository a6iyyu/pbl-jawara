import 'package:flutter/material.dart';

class SharedCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;
  final IconData icon;

  const SharedCard({
    super.key,
    required this.title,
    required this.child,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- BAGIAN YANG DIPERBAIKI ADA DI SINI ---
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                // FIX: Bungkus widget Text dengan Flexible
                // Ini mencegah title mendorong layout hingga overflow.
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    // Optional: Menambahkan ellipsis (...) jika teks masih terlalu panjang
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}