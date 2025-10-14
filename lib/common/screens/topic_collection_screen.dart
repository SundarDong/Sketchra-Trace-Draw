// lib/screens/topic_collection_screen.dart
import 'package:flutter/material.dart';
import 'package:sketchtrace/models/topic_model.dart';
import 'package:sketchtrace/common/screens/select_mode_screen.dart';
import 'package:sketchtrace/core/widgets/modern_app_bar.dart';

class TopicCollectionScreen extends StatelessWidget {
  final TopicModel topic;

  const TopicCollectionScreen({super.key, required this.topic});

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
      appBar: ModernAppBar(title: topic.title),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose ${topic.title} Image',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select an image to start sketching',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemCount: topic.imageCollection.length,
                itemBuilder: (context, index) {
                  final imagePath = topic.imageCollection[index];
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
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
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
                            size: 40,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Image not found',
                            style: TextStyle(
                              fontSize: 12,
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
                  borderRadius: BorderRadius.circular(16),
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
