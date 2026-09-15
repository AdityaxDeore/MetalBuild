import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CandidateReview extends StatelessWidget {
  const CandidateReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Candidate Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Priya Menon', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const Text('Registered Nurse', style: TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondary),
                      SizedBox(width: 4),
                      Text('Kochi, Kerala', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.verified, size: 14, color: AppColors.primary),
                        SizedBox(width: 4),
                        Text('Verified', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  const DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textSecondary,
                          indicatorColor: AppColors.primary,
                          tabs: [
                            Tab(text: 'Profile'),
                            Tab(text: 'Documents'),
                            Tab(text: 'Applications'),
                            Tab(text: 'Notes'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  const Align(alignment: Alignment.centerLeft, child: Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 8),
                  const Text('Compassionate and skilled nurse with 3+ years of experience in critical care and patient management. Passionate about delivering high-quality healthcare.', style: TextStyle(color: AppColors.textSecondary, height: 1.5)),
                  const SizedBox(height: 24),
                  
                  Row(
                    children: [
                      Expanded(child: _buildInfoItem(Icons.work_outline, 'Experience', '3 years')),
                      Expanded(child: _buildInfoItem(Icons.school_outlined, 'Qualification', 'B.Sc. Nursing')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildInfoItem(Icons.local_hospital_outlined, 'Specialization', 'Critical Care')),
                      Expanded(child: _buildInfoItem(Icons.access_time, 'Availability', 'Immediate')),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Documents', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      TextButton(onPressed: () {}, child: const Text('View all')),
                    ],
                  ),
                  _buildDocumentItem('Degree Certificate', true),
                  _buildDocumentItem('Nursing Registration', true),
                  _buildDocumentItem('Government ID', true),
                  
                  const SizedBox(height: 80),
                ],
              ),
            ),
          )
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
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.error),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Reject', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.error)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Shortlist', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 20, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildDocumentItem(String name, bool isVerified) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold))),
          if (isVerified)
            const Text('Verified', style: TextStyle(color: AppColors.success, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
