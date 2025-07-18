import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class QuickActionsWidget extends StatelessWidget {
  final VoidCallback onQrScan;
  final VoidCallback onSearch;
  final VoidCallback onEmergency;

  const QuickActionsWidget({
    super.key,
    required this.onQrScan,
    required this.onSearch,
    required this.onEmergency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.qr_code_scanner,
                  label: 'Scan QR',
                  color: AppColors.primaryColor,
                  onTap: onQrScan,
                ),
                _buildActionButton(
                  icon: Icons.search,
                  label: 'Search Bus',
                  color: Colors.blue,
                  onTap: onSearch,
                ),
                _buildActionButton(
                  icon: Icons.emergency,
                  label: 'Emergency',
                  color: Colors.red,
                  onTap: onEmergency,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.route,
                  label: 'Routes',
                  color: Colors.green,
                  onTap: () {
                    // Navigate to routes page
                  },
                ),
                _buildActionButton(
                  icon: Icons.feedback,
                  label: 'Feedback',
                  color: Colors.orange,
                  onTap: () {
                    // Navigate to feedback page
                  },
                ),
                _buildActionButton(
                  icon: Icons.info,
                  label: 'Safety Info',
                  color: Colors.purple,
                  onTap: () {
                    // Navigate to safety info page
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
