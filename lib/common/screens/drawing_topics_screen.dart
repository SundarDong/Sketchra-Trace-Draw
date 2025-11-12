import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/common/screens/select_mode_screen.dart';
import 'package:sketchtrace/common/screens/topic_collection_screen.dart';
import 'package:sketchtrace/models/topic_model.dart';
import 'package:sketchtrace/core/widgets/topic_card.dart';
import 'package:sketchtrace/core/widgets/import_button.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class DrawingTopicsScreen extends StatefulWidget {
  const DrawingTopicsScreen({super.key});

  @override
  State<DrawingTopicsScreen> createState() => _DrawingTopicsScreenState();
}

class _DrawingTopicsScreenState extends State<DrawingTopicsScreen> {
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
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Import Photo Section
              Text(
                'Import photo',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              16.verticalSpace,
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
                  12.horizontalSpace,
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
              32.verticalSpace,

              // Choose Topic Section
              Text(
                'Choose topic',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              16.verticalSpace,

              // Topics Grid - Using data from TopicData
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
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
