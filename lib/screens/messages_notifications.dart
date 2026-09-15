import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MessagesNotifications extends StatelessWidget {
  const MessagesNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.edit_square, color: AppColors.primary), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(26), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]),
                      child: const Center(child: Text('Messages', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Notifications', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                          child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildMessageTile('Apollo Hospitals', 'We would like to schedule an inter...', '10:30 AM', 2, true, 'https://i.pravatar.cc/150?img=11'),
                _buildMessageTile('CityCare Hospital', 'Thank you for your application. W...', 'Yesterday', 0, false, 'https://i.pravatar.cc/150?img=12'),
                _buildMessageTile('Fortis Healthcare', 'Your application is under review...', '2 days ago', 0, false, 'https://i.pravatar.cc/150?img=13'),
                _buildMessageTile('HR Team', 'Please share your updated docum...', '3 days ago', 0, false, 'https://i.pravatar.cc/150?img=14'),
                _buildMessageTile('Dr. Meera Nair', 'Happy to connect. Let me know if...', '5 days ago', 0, false, 'https://i.pravatar.cc/150?img=15'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time, int unreadCount, bool isVerified, String imgUrl) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imgUrl),
          ),
          if (isVerified)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.verified, size: 16, color: Colors.blue),
              ),
            ),
        ],
      ),
      title: Text(name, style: TextStyle(fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.normal)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: unreadCount > 0 ? AppColors.textPrimary : AppColors.textSecondary)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(fontSize: 12, color: unreadCount > 0 ? AppColors.primary : AppColors.textSecondary)),
          const SizedBox(height: 4),
          if (unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
              child: Text(unreadCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
