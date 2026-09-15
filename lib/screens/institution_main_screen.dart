import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'institution_dashboard.dart';
import 'candidate_review.dart';
import 'messages_notifications.dart';

class InstitutionMainScreen extends StatefulWidget {
  const InstitutionMainScreen({super.key});

  @override
  State<InstitutionMainScreen> createState() => _InstitutionMainScreenState();
}

class _InstitutionMainScreenState extends State<InstitutionMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const InstitutionDashboard(),
      const Center(child: Text('Jobs List Placeholder')),
      _buildApplicantsList(context),
      const MessagesNotifications(),
      const Center(child: Text('Profile Placeholder')),
    ];

    return Scaffold(
      body: screens[_currentIndex],
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
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), activeIcon: Icon(Icons.people), label: 'Applicants'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), activeIcon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildApplicantsList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Applicants', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Tap an applicant to review their profile:', style: TextStyle(color: AppColors.textSecondary)),
          const SizedBox(height: 16),
          ListTile(
            leading: const CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5')),
            title: const Text('Priya Menon', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Registered Nurse'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CandidateReview())),
          ),
        ],
      ),
    );
  }
}
