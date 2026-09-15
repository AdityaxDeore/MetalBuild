import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'professional_dashboard.dart';
import 'job_discovery.dart';
import 'application_tracking.dart';
import 'messages_notifications.dart';
import 'professional_verification.dart';

class ProfessionalMainScreen extends StatefulWidget {
  const ProfessionalMainScreen({super.key});

  @override
  State<ProfessionalMainScreen> createState() => _ProfessionalMainScreenState();
}

class _ProfessionalMainScreenState extends State<ProfessionalMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfessionalDashboard(),
    const JobDiscovery(),
    const ApplicationTracking(), // Placeholder for applications list
    const MessagesNotifications(),
    const ProfessionalVerification(), // Placeholder for Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), activeIcon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), activeIcon: Icon(Icons.assignment), label: 'Applications'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), activeIcon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
