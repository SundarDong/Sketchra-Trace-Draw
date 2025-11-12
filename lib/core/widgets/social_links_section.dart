import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/core/widgets/social_button.dart';

class SocialLinksSection extends StatelessWidget {
  final Future<void> Function(String) onLaunchUrl;

  const SocialLinksSection({super.key, required this.onLaunchUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Connect With Us',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          8.verticalSpace,
          Text(
            'Follow us on social media',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialButton(
                imagePath: 'assets/images/social/facebook.jpeg',
                label: 'Facebook',
                url: 'https://www.facebook.com/share/1VxEYWeTeK/',
                onTap: onLaunchUrl,
              ),

              SocialButton(
                imagePath: 'assets/images/social/instagram.jpeg',
                label: 'Instagram',
                url: 'https://www.instagram.com/appsketchra',
                onTap: onLaunchUrl,
              ),

              SocialButton(
                imagePath: 'assets/images/social/youtube.jpeg',
                label: 'YouTube',
                url: 'https://www.youtube.com/@Sketchratracedraw',
                onTap: onLaunchUrl,
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialButton(
                imagePath: 'assets/images/social/twitter.jpeg',
                label: 'Twitter',
                url: 'https://x.com/Appsketchra?t=FC-HJf6fCg6GiXZ3DOW7KA&s=09',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                imagePath: 'assets/images/social/tiktok.jpeg',
                label: 'TikTok',
                url:
                    'https://www.tiktok.com/@sketchra.ar.trace?_r=1&_t=ZS-9179aEYDMcH',
                onTap: onLaunchUrl,
              ),
              SocialButton(
                imagePath: 'assets/images/social/website.jpeg',
                label: 'Website',
                url: 'Sketchra.com',
                onTap: onLaunchUrl,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
