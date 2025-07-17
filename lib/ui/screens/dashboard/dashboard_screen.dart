import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/color_constants.dart';
import '../../../providers/app_providers.dart';
import '../../widgets/loading_overlay.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Dashboard',
    'Bus Tracking',
    'Safety Alerts',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    // Using simple dashboard state for now
    // final dashboardState = ref.watch(dashboardControllerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Emergency Button
          IconButton(
            onPressed: () {
              _showEmergencyDialog(context);
            },
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.errorColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.emergency,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Notifications
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                if (true) // dashboardState.activeAlerts.isNotEmpty - mock for demo
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.errorColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '2', // '${dashboardState.activeAlerts.length}' - mock for demo
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: LoadingOverlay(
        isLoading: false, // dashboardState.isLoading - mock for demo
        child: IndexedStack(
          index: _currentIndex,
          children: [
            _buildDashboardView(),
            _buildBusTrackingView(),
            _buildSafetyAlertsView(),
            _buildProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: 'Bus Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_outlined),
            activeIcon: Icon(Icons.warning),
            label: 'Safety',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardView() {
    final user = ref.watch(currentUserProvider);
    // final dashboardState = ref.watch(dashboardControllerProvider); // Commented out for demo
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user?.firstName ?? 'User',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Downtown Transit Hub', // dashboardState.locationAddress ?? 'Location not available' - mock
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Quick Actions
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.directions_bus,
                  title: 'Find Bus',
                  subtitle: 'Track nearby buses',
                  color: AppColors.primaryColor,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.emergency,
                  title: 'Emergency',
                  subtitle: 'Get help now',
                  color: AppColors.errorColor,
                  onTap: () {
                    _showEmergencyDialog(context);
                  },
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.route,
                  title: 'Plan Route',
                  subtitle: 'Find best route',
                  color: AppColors.secondaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/route-planner');
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickActionCard(
                  icon: Icons.history,
                  title: 'Trip History',
                  subtitle: 'View past trips',
                  color: AppColors.warningColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/trip-history');
                  },
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Nearby Buses
          const Text(
            'Nearby Buses',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 16),
          
          if (false) // dashboardState.nearbyBuses.isEmpty - mock to show buses
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.greyLight),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.directions_bus_outlined,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'No buses nearby',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    'Enable location to see nearby buses',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // dashboardState.nearbyBuses.length - mock data
              itemBuilder: (context, index) {
                // final bus = dashboardState.nearbyBuses[index]; - using mock data
                final mockBuses = [
                  {'name': 'Bus Route 42', 'eta': '5 min', 'status': 'On Time'},
                  {'name': 'Express Line A', 'eta': '8 min', 'status': 'Delayed'},
                  {'name': 'City Loop 3', 'eta': '12 min', 'status': 'On Time'},
                ];
                final bus = mockBuses[index];
                return _buildBusCard(bus);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusCard(bus) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.directions_bus,
              color: AppColors.primaryColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus['name'] ?? 'Unknown Bus', // 'Bus ${bus.busNumber}' - updated for mock data
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status: ${bus['status'] ?? 'Unknown'}', // 'Route: ${bus.routeName}' - updated for mock data
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'ETA: ${bus['eta'] ?? 'Unknown'}', // 'ETA: ${bus.estimatedArrival}' - updated for mock data
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildBusTrackingView() {
    return const Center(
      child: Text('Bus Tracking View - Coming Soon'),
    );
  }

  Widget _buildSafetyAlertsView() {
    return const Center(
      child: Text('Safety Alerts View - Coming Soon'),
    );
  }

  Widget _buildProfileView() {
    return const Center(
      child: Text('Profile View - Coming Soon'),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency Alert'),
        content: const Text('Are you sure you want to send an emergency alert?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Trigger emergency alert - commented out for demo
              // ref.read(dashboardControllerProvider.notifier).reportEmergency(
              //   type: 'PANIC',
              //   description: 'Emergency reported from dashboard',
              // );
              
              // Show success message for demo
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Emergency alert sent!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorColor,
            ),
            child: const Text('Send Alert'),
          ),
        ],
      ),
    );
  }
}
