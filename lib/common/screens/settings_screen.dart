import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Rate app function
  Future<void> _rateApp(BuildContext context) async {
    const String androidUrl =
        'https://play.google.com/store/apps/details?id=YOUR_PACKAGE_NAME';
    const String iosUrl = 'https://apps.apple.com/app/idYOUR_APP_ID';

    final Uri url = Uri.parse(androidUrl);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open app store')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  // Share app function
  void _shareApp() {
    const String appName = 'SketchTrace';
    const String appUrl =
        'https://play.google.com/store/apps/details?id=YOUR_PACKAGE_NAME';
    const String shareText = 'Check out $appName! Download it here: $appUrl';

    Share.share(shareText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const ModernAppBar(title: 'Settings'),
      body: ListView(
        padding: EdgeInsets.all(16.0.r),
        children: [
          _buildSettingCard(
            context: context,
            icon: Icons.star_rounded,
            iconColor: Colors.amber,
            title: 'Rate Us',
            subtitle: 'Enjoying the app? Rate us on the store',
            onTap: () => _rateApp(context),
          ),
          12.verticalSpace,
          _buildSettingCard(
            context: context,
            icon: Icons.share_rounded,
            iconColor: Colors.blue,
            title: 'Share App',
            subtitle: 'Share with friends and family',
            onTap: _shareApp,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        leading: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: iconColor, size: 28.sp),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
        onTap: onTap,
      ),
    );
  }
}
