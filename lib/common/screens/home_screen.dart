import 'package:flutter/material.dart';
import 'package:sketchtrace/common/screens/drawing_topics_screen.dart';
import 'package:sketchtrace/common/screens/settings_screen.dart';
//import 'package:sketchtrace/core/widgets/customappbar.dart';
import 'package:sketchtrace/core/widgets/menu_button.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const ModernAppBar(title: 'Sketch'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MenuButton(
              imagePath: 'assets/images/a.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrawingTopicsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            MenuButton(
              imagePath: 'assets/images/b.png',
              onTap: () {
                // Navigate to guide screen
              },
            ),
            const SizedBox(height: 20),
            MenuButton(
              imagePath: 'assets/images/c.png',
              onTap: () {
                // Navigate to settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
