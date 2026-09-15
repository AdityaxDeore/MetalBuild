import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ApplicationTracking extends StatelessWidget {
  const ApplicationTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Application Details', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Job Header
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: AppColors.border)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.local_hospital, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Staff Nurse', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Row(
                            children: const [
                              Text('Apollo Hospitals', style: TextStyle(color: AppColors.textSecondary)),
                              SizedBox(width: 4),
                              Icon(Icons.verified, size: 14, color: Colors.blue),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text('Applied on 12 Sep 2025', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Timeline
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  _buildTimelineItem('Applied', '12 Sep 2025, 10:30 AM', 'Your application has been submitted.', true, true),
                  _buildTimelineItem('Under Review', '14 Sep 2025', 'The institution is reviewing your profile.', true, true),
                  _buildTimelineItem('Shortlisted', '18 Sep 2025', 'Congratulations! You\'ve been shortlisted for an interview.', true, false, isCurrent: true),
                  _buildTimelineItem('Interview', 'Pending', '', false, false),
                  _buildTimelineItem('Offered', '-', '', false, false),
                  _buildTimelineItem('Accepted', '-', '', false, false),
                  _buildTimelineItem('Hired', '-', '', false, false, isLast: true),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: AppColors.border),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Withdraw Application', style: TextStyle(color: AppColors.textSecondary)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String date, String description, bool isCompleted, bool hasLine, {bool isCurrent = false, bool isLast = false}) {
    Color iconColor = isCompleted || isCurrent ? AppColors.primary : Colors.grey[300]!;
    if (isCurrent) iconColor = Colors.blue;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.primary : (isCurrent ? Colors.blue : Colors.grey[300]),
                  shape: BoxShape.circle,
                ),
                child: isCompleted ? const Icon(Icons.check, size: 16, color: Colors.white) : (isCurrent ? const Icon(Icons.circle, size: 12, color: Colors.white) : null),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: hasLine ? AppColors.primary : Colors.grey[300],
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isCompleted || isCurrent ? AppColors.textPrimary : AppColors.textSecondary)),
                  const SizedBox(height: 2),
                  Text(date, style: TextStyle(fontSize: 12, color: isCurrent ? Colors.blue : AppColors.textSecondary)),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(description, style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
