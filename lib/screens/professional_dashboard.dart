import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'job_detail.dart';

class ProfessionalDashboard extends StatelessWidget {
  const ProfessionalDashboard({super.key});

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
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hi, Dr. Aditi Sharma \u{1F44B}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Let's build your next opportunity", style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 20),
            
            // Profile Completion Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: AppColors.border)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(value: 0.8, backgroundColor: AppColors.secondary, color: AppColors.primary),
                        const Icon(Icons.person_outline, color: AppColors.primary),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Profile Completion', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text('80%', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text('Complete your profile to get more visibility', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Verification Card
            Card(
              elevation: 0,
              color: AppColors.secondary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.description_outlined, color: AppColors.primary, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Verification', style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                            child: const Text('Under Review', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 4),
                          const Text('Submitted on 12 Sep 2025\nWe\'ll notify you once verified.', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Stats Row
            Row(
              children: [
                _buildStatCard('12', 'Applied'),
                const SizedBox(width: 12),
                _buildStatCard('3', 'Shortlisted'),
                const SizedBox(width: 12),
                _buildStatCard('1', 'Interviews'),
                const SizedBox(width: 12),
                _buildStatCard('0', 'Offers'),
              ],
            ),
            const SizedBox(height: 24),

            // Recommended Jobs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recommended Jobs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('See all')),
              ],
            ),
            
            // Job Card
            _buildJobCard(context, 'Staff Nurse', 'Apollo Hospitals', 'Bangalore, Karnataka', '\u20B94-7 LPA', 'Full-time', true),
            const SizedBox(height: 12),
            _buildJobCard(context, 'Registered Nurse', 'Fortis Healthcare', 'Gurgaon, Haryana', '\u20B93-5 LPA', 'Full-time', false),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(number, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(BuildContext context, String title, String hospital, String location, String salary, String type, bool isUrgent) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const JobDetail()));
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: AppColors.border)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Icon(Icons.bookmark_border, color: AppColors.textSecondary),
                ],
              ),
              const SizedBox(height: 4),
              Text(hospital, style: const TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(location, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(salary, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(width: 12),
                  const Icon(Icons.work_outline, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(type, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, size: 12, color: AppColors.success),
                        const SizedBox(width: 4),
                        const Text('Verified', style: TextStyle(fontSize: 12, color: AppColors.success, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  if (isUrgent) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: const Text('Urgent', style: TextStyle(fontSize: 12, color: AppColors.error, fontWeight: FontWeight.bold)),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
