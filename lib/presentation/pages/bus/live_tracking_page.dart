import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class LiveTrackingPage extends StatelessWidget {
  final String? busId;
  
  const LiveTrackingPage({super.key, this.busId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Live Tracking Page - Bus ID: ${busId ?? 'Unknown'}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
