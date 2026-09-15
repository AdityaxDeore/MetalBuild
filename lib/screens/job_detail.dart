import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'application_tracking.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => Navigator.pop(context)),
            actions: [
              IconButton(icon: const Icon(Icons.ios_share, color: AppColors.textPrimary), onPressed: () {}),
              IconButton(icon: const Icon(Icons.bookmark_border, color: AppColors.textPrimary), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[300],
                child: const Center(child: Text('Hospital Image Placeholder', style: TextStyle(color: Colors.grey))),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Staff Nurse', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      const Icon(Icons.verified, color: AppColors.primary, size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Apollo Hospitals', style: TextStyle(fontSize: 16, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  
                  // Metadata
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      Text('Bangalore, Karnataka', style: TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.account_balance_wallet_outlined, size: 16, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      Text('\u20B94-7 LPA', style: TextStyle(color: AppColors.textSecondary)),
                      SizedBox(width: 16),
                      Icon(Icons.work_outline, size: 16, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      Text('Full-time', style: TextStyle(color: AppColors.textSecondary)),
                      SizedBox(width: 16),
                      Icon(Icons.business_center_outlined, size: 16, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      Text('On-site', style: TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Badges
                  Row(
                    children: [
                      _buildBadge(Icons.check_circle, 'Verified Employer'),
                      const SizedBox(width: 8),
                      _buildBadge(Icons.people_outline, '200+ Employees'),
                      const SizedBox(width: 8),
                      _buildBadge(Icons.health_and_safety_outlined, 'Healthcare'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Tabs
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
                            Tab(text: 'About'),
                            Tab(text: 'Requirements'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Description
                  const Text('Job Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('We are looking for compassionate and skilled nurses to join our multi-speciality hospital. You will be part of a dynamic care team delivering high-quality patient care.', style: TextStyle(color: AppColors.textSecondary, height: 1.5)),
                  const SizedBox(height: 16),
                  
                  const Text('Key Responsibilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildBulletPoint('Provide patient care and support'),
                  _buildBulletPoint('Assist doctors in clinical procedures'),
                  _buildBulletPoint('Maintain patient records'),
                  _buildBulletPoint('Ensure compliance with hospital protocols'),
                  
                  const SizedBox(height: 80), // Padding for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.bookmark_border, color: AppColors.textPrimary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ApplicationTracking()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Apply Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('\u2022 ', style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(color: AppColors.textPrimary))),
        ],
      ),
    );
  }
}
