import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/models/topic_model.dart';
import 'package:sketchtrace/common/screens/select_mode_screen.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

class TopicCollectionScreen extends StatefulWidget {
  final TopicModel topic;

  const TopicCollectionScreen({super.key, required this.topic});

  @override
  State<TopicCollectionScreen> createState() => _TopicCollectionScreenState();
}

class _TopicCollectionScreenState extends State<TopicCollectionScreen> {
  void _onImageTap(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectModeScreen(imagePath: imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: ModernAppBar(title: widget.topic.title),
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose ${widget.topic.title} Image',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            8.verticalSpace,
            Text(
              'Select an image to start sketching',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
            ),
            20.verticalSpace,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.85,
                ),
                itemCount: widget.topic.imageCollection.length,
                itemBuilder: (context, index) {
                  final imagePath = widget.topic.imageCollection[index];
                  return ImageCollectionCard(
                    imagePath: imagePath,
                    onTap: () => _onImageTap(context, imagePath),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCollectionCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ImageCollectionCard({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported,
                            size: 40.sp,
                            color: Colors.grey.shade400,
                          ),
                          8.verticalSpace,
                          Text(
                            'Image not found',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Hover effect overlay
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(16.r),
                  splashColor: Colors.black.withOpacity(0.1),
                  highlightColor: Colors.black.withOpacity(0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
