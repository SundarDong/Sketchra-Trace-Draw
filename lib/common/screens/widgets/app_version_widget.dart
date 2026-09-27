import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({super.key});

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  final ValueNotifier<String> versionNotifier = ValueNotifier('');

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    versionNotifier.value = packageInfo.version;
  }

  @override
  void dispose() {
    versionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return ValueListenableBuilder<String>(
      valueListenable: versionNotifier,
      builder: (context, version, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (version.isNotEmpty)
              Text(
                'Version $version',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade500),
              ),

            4.verticalSpace,

            Text(
              '© $currentYear All rights reserved.',
              style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade500),
            ),
          ],
        );
      },
    );
  }
}
