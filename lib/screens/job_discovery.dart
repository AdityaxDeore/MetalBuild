import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'job_detail.dart';

class JobDiscovery extends StatelessWidget {
  const JobDiscovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Next Opportunity', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Jobs that match your skills and passion.', style: TextStyle(color: AppColors.textSecondary)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by role, hospital, or keyword',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildFilterChip('Location'),
                _buildFilterChip('Specialization'),
                _buildFilterChip('Job Type'),
                _buildFilterChip('Experience'),
                _buildFilterChip('Salary Range'),
                _buildFilterChip('Work Mode'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('248 jobs found', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: const [
                    Text('Sort', style: TextStyle(color: AppColors.textSecondary)),
                    Icon(Icons.swap_vert, size: 16, color: AppColors.textSecondary),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildJobCard(context, 'ICU Nurse', 'Apollo Hospitals', 'Bangalore, Karnataka', '\u20B94-7 LPA', 'Full-time', true, false),
                const SizedBox(height: 12),
                _buildJobCard(context, 'Physiotherapist', 'Fortis Healthcare', 'Gurgaon, Haryana', '\u20B93-5 LPA', 'Full-time', false, true),
                const SizedBox(height: 12),
                _buildJobCard(context, 'Lab Technician', 'Max Healthcare', 'Delhi, NCR', '\u20B92-4 LPA', 'Full-time', false, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textPrimary)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
        ],
      ),
    );
  }

  Widget _buildJobCard(BuildContext context, String title, String hospital, String location, String salary, String type, bool isUrgent, bool isNew) {
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
                  ],
                  if (isNew) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.purple.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: const Text('New', style: TextStyle(fontSize: 12, color: Colors.purple, fontWeight: FontWeight.bold)),
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
