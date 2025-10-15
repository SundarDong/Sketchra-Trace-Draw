import 'package:flutter/material.dart';
import 'package:sketchtrace/core/widgets/social_button.dart';

class SocialLinksSection extends StatelessWidget {
  final Future<void> Function(String) onLaunchUrl;

  const SocialLinksSection({super.key, required this.onLaunchUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Connect With Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Follow us on social media',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialButton(
                icon: Icons.facebook,
                color: const Color(0xFF1877F2),
                label: 'Facebook',
                url: 'https://facebook.com/yourpage',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                icon: Icons.camera_alt, // For Instagram
                color: const Color(0xFFE4405F),
                label: 'Instagram',
                url: 'https://instagram.com/yourpage',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                icon: Icons.ondemand_video, // For YouTube
                color: const Color(0xFFFF0000),
                label: 'YouTube',
                url: 'https://youtube.com/yourchannel',
                onTap: onLaunchUrl,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialButton(
                icon: Icons.chat, // For Twitter
                color: const Color(0xFF1DA1F2),
                label: 'Twitter',
                url: 'https://twitter.com/yourpage',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                icon: Icons.music_note, // For TikTok
                color: Colors.black,
                label: 'TikTok',
                url: 'https://tiktok.com/@yourpage',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                icon: Icons.public, // For Website
                color: const Color(0xFF0088CC),
                label: 'Website',
                url: 'https://yourwebsite.com',
                onTap: onLaunchUrl,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
