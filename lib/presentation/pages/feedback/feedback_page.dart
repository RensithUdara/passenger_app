import 'package:flutter/material.dart';
import '../../../core/constants/color_constants.dart';

class FeedbackPage extends StatelessWidget {
  final String? busId;
  final String? driverId;
  final String? tripId;

  const FeedbackPage({super.key, this.busId, this.driverId, this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Feedback'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Feedback Page - Coming Soon',
              style: TextStyle(fontSize: 18),
            ),
            if (busId != null) ...[
              const SizedBox(height: 8),
              Text('Bus ID: $busId'),
            ],
            if (driverId != null) ...[
              const SizedBox(height: 8),
              Text('Driver ID: $driverId'),
            ],
            if (tripId != null) ...[
              const SizedBox(height: 8),
              Text('Trip ID: $tripId'),
            ],
          ],
        ),
      ),
    );
  }
}
