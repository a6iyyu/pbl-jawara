import 'package:flutter/material.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income Page'),
      ),
      body: const Center(
        child: Text('This is the Income Page'),
      ),
    );
  }
}