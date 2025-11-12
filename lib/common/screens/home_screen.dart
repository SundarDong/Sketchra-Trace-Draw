import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/common/screens/drawing_topics_screen.dart';
import 'package:sketchtrace/common/screens/guide_screen.dart';
import 'package:sketchtrace/common/screens/settings_screen.dart';
import 'package:sketchtrace/core/widgets/menu_button.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

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
    // Get anonymous app instance ID (as a getter now)
    userId = await analytics.appInstanceId;

    // Log screen view (new method)
    await analytics.logScreenView(
      screenName: 'HomeScreen',
      screenClass: 'HomeScreen',
    );

    // Log activity in Firestore
    if (userId != null) {
      await firestore.collection('user_activity').doc(userId).set({
        'last_seen': FieldValue.serverTimestamp(),
        'screen': 'HomeScreen',
        'device': '${Theme.of(context).platform}',
        'app_version': '1.0.0',
      }, SetOptions(merge: true));
    }
  }

  // Helper function to log feature usage
  Future<void> logFeature(String featureName) async {
    // Firebase Analytics event
    await analytics.logEvent(
      name: 'feature_use',
      parameters: {'feature_name': featureName},
    );

    // Firestore update
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
          children: [
            MenuButton(
              imagePath: 'assets/images/a.png',
              onTap: () {
                navigateTo(const DrawingTopicsScreen(), 'DrawingTopics');
              },
            ),
            20.verticalSpace,
            MenuButton(
              imagePath: 'assets/images/b.png',
              onTap: () {
                navigateTo(const GuideScreen(), 'GuideScreen');
              },
            ),
            20.verticalSpace,
            MenuButton(
              imagePath: 'assets/images/c.png',
              onTap: () {
                navigateTo(const SettingsScreen(), 'SettingsScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
