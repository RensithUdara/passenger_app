import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Payment Methods Page - Coming Soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
