import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SettingsUtils {
  // Rate app function
  static Future<void> rateApp(BuildContext context) async {
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
  static void shareApp() {
    const String appName = 'SketchTrace';
    const String appUrl =
        'https://play.google.com/store/apps/details?id=YOUR_PACKAGE_NAME';
    const String shareText = 'Check out $appName! Download it here: $appUrl';

    Share.share(shareText);
  }
}
