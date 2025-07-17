import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        backgroundColor: AppColors.errorColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Emergency Page - Coming Soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
