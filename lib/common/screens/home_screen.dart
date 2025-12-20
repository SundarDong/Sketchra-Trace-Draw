import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/core/widgets/menu_button.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';
import 'package:sketchtrace/utils/app_routing/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? userId;

  @override
  void initState() {
    super.initState();
    initAnalytics();
  }

  Future<void> initAnalytics() async {
    userId = await analytics.appInstanceId;

    await analytics.logScreenView(
      screenName: 'HomeScreen',
      screenClass: 'HomeScreen',
    );

    if (userId != null) {
      await firestore.collection('user_activity').doc(userId).set({
        'last_seen': FieldValue.serverTimestamp(),
        'screen': 'HomeScreen',
        'device': '${Theme.of(context).platform}',
        'app_version': '1.0.0',
      }, SetOptions(merge: true));
    }
  }

  Future<void> logFeature(String featureName) async {
    await analytics.logEvent(
      name: 'feature_use',
      parameters: {'feature_name': featureName},
    );

    if (userId != null) {
      await firestore.collection('user_activity').doc(userId).set({
        'last_seen': FieldValue.serverTimestamp(),
        'feature_used': FieldValue.arrayUnion([featureName]),
      }, SetOptions(merge: true));
    }
  }

  void navigateTo(Widget screen, String featureName) {
    logFeature(featureName);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const ModernAppBar(title: 'Sketch', showBackButton: false),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // <-- space between buttons and watermark
          children: [
            Column(
              children: [
                MenuButton(
                  imagePath: 'assets/images/a.png',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.drawScreenRoute);
                  },
                ),
                20.verticalSpace,
                MenuButton(
                  imagePath: 'assets/images/b.png',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.guideScreenRoute);
                  },
                ),
                20.verticalSpace,
                MenuButton(
                  imagePath: 'assets/images/c.png',
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.settingScreenRoute);
                  },
                ),
              ],
            ),

            // Watermark
            Text(
              'Designed by Sundar Dong',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
