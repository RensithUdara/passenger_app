import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../controllers/dashboard_controller.dart';

class RecentActivityWidget extends ConsumerWidget {
  const RecentActivityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);
    final recentActivity = dashboardState.recentActivity;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Activity',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to full activity history
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (recentActivity.isEmpty)
              _buildEmptyState()
            else
              Column(
                children: recentActivity
                    .take(5)
                    .map((activity) => _buildActivityItem(activity))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.history,
            size: 48,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No recent activity',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your recent bus journeys and activities will appear here',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String activity) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6, right: 12),
            decoration: BoxDecoration(
              color: _getActivityColor(activity),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _getTimeAgo(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            _getActivityIcon(activity),
            size: 16,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Color _getActivityColor(String activity) {
    if (activity.toLowerCase().contains('boarded')) {
      return Colors.green;
    } else if (activity.toLowerCase().contains('feedback')) {
      return Colors.blue;
    } else if (activity.toLowerCase().contains('alert')) {
      return Colors.orange;
    } else if (activity.toLowerCase().contains('notification')) {
      return Colors.purple;
    }
    return AppColors.primaryColor;
  }

  IconData _getActivityIcon(String activity) {
    if (activity.toLowerCase().contains('boarded')) {
      return Icons.directions_bus;
    } else if (activity.toLowerCase().contains('feedback')) {
      return Icons.feedback;
    } else if (activity.toLowerCase().contains('alert')) {
      return Icons.warning;
    } else if (activity.toLowerCase().contains('notification')) {
      return Icons.notifications;
    }
    return Icons.info;
  }

  String _getTimeAgo() {
    // Mock time ago - in a real app, this would calculate actual time difference
    final times = [
      '2 min ago',
      '5 min ago',
      '15 min ago',
      '1 hour ago',
      '2 hours ago'
    ];
    times.shuffle();
    return times.first;
  }
}
