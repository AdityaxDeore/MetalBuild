import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.health_and_safety, color: AppColors.primary),
            const SizedBox(width: 8),
            const Text('MedNEST', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: AppColors.primary, child: const Text('A', style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Admin Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Manage and monitor the platform', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 24),
            
            const DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.textSecondary,
                    indicatorColor: AppColors.primary,
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Verification'),
                      Tab(text: 'Jobs'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Grid of stats
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard('125', 'Professionals', 'Pending Verification'),
                _buildStatCard('18', 'Institutions', 'Pending Approval'),
                _buildStatCard('32', 'Jobs', 'Pending Approval'),
                _buildStatCard('14', 'Complaints', 'Open'),
              ],
            ),
            const SizedBox(height: 24),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Activities', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('View all')),
              ],
            ),
            
            _buildActivityItem(Icons.person_add, 'New professional registration', 'Priya Menon \u2022 10 mins ago', Colors.blue),
            _buildActivityItem(Icons.work, 'Job approval pending', 'CityCare Hospital \u2022 25 mins ago', Colors.purple),
            _buildActivityItem(Icons.warning, 'Document flagged', 'Rahul Singh \u2022 1 hour ago', Colors.red),
            _buildActivityItem(Icons.message, 'New complaint', 'Regarding job application \u2022 2 hours ago', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(number, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String title, String subtitle, Color iconColor) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.1),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
    );
  }
}
