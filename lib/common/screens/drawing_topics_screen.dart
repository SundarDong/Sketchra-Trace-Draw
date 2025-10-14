import 'package:flutter/material.dart';
import 'package:sketchtrace/common/screens/select_mode_screen.dart';
import 'package:sketchtrace/common/screens/topic_collection_screen.dart';
import 'package:sketchtrace/models/topic_model.dart';
import 'package:sketchtrace/core/widgets/topic_card.dart';
import 'package:sketchtrace/core/widgets/import_button.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class DrawingTopicsScreen extends StatelessWidget {
  const DrawingTopicsScreen({super.key});

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (image != null && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectModeScreen(imagePath: image.path),
          ),
        );
      }
    } catch (e) {
      print('Error picking image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Failed to pick image')));
      }
    }
  }

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectModeScreen(imagePath: image.path),
          ),
        );
      }
    } catch (e) {
      print('Error capturing image: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to capture image')),
        );
      }
    }
  }

  void _onTopicTap(BuildContext context, TopicModel topic) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TopicCollectionScreen(topic: topic),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const ModernAppBar(title: 'Sketch'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Import Photo Section
              const Text(
                'Import photo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ImportButton(
                      icon: Icons.photo_library,
                      title: 'From gallery',
                      color: const Color(0xFF00BCD4),
                      onTap: () => _pickImageFromGallery(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ImportButton(
                      icon: Icons.camera_alt,
                      title: 'From Camera',
                      color: const Color(0xFFFF7043),
                      onTap: () => _pickImageFromCamera(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Choose Topic Section
              const Text(
                'Choose topic',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Topics Grid - Using data from TopicData
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: TopicData.topics.length,
                itemBuilder: (context, index) {
                  final topic = TopicData.topics[index];
                  return TopicCard(
                    imagePath: topic.imagePath,
                    title: topic.title,
                    onTap: () => _onTopicTap(context, topic),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
