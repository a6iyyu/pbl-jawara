import 'package:flutter/material.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spending Page'),
      ),
      body: const Center(
        child: Text('This is the Spending Page'),
      ),
    );
  }
}