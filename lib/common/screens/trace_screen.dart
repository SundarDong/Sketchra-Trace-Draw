import 'dart:io';
import 'package:flutter/material.dart';

class TraceScreen extends StatefulWidget {
  final String imagePath;

  const TraceScreen({super.key, required this.imagePath});

  @override
  State<TraceScreen> createState() => _TraceScreenState();
}

class _TraceScreenState extends State<TraceScreen> {
  double opacity = 1.0;
  bool isLocked = false;
  bool isExtended = false;

  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset _startFocalPoint = Offset.zero;
  double _startScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),

          // ✅ FIXED — image supports both assets and files
          Positioned.fill(
            child: GestureDetector(
              onScaleStart: isLocked
                  ? null
                  : (details) {
                      _startScale = _scale;
                      _startFocalPoint = details.focalPoint - _offset;
                    },
              onScaleUpdate: isLocked
                  ? null
                  : (details) {
                      setState(() {
                        _scale = (_startScale * details.scale).clamp(0.5, 5.0);
                        _offset =
                            details.focalPoint -
                            _startFocalPoint * details.scale;
                      });
                    },
              child: Transform.translate(
                offset: _offset,
                child: Transform.scale(
                  scale: _scale,
                  child: Center(
                    child: Opacity(
                      opacity: opacity,
                      child: widget.imagePath.startsWith('assets/')
                          ? Image.asset(widget.imagePath, fit: BoxFit.contain)
                          : Image.file(
                              File(widget.imagePath),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          if (!isExtended)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                            size: 28,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.help_outline,
                          color: Colors.black87,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          if (!isExtended)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildControlButton(
                        icon: Icons.opacity,
                        label: 'Opacity',
                        onTap: _showOpacitySlider,
                        color: Colors.grey.shade700,
                      ),
                      _buildControlButton(
                        icon: isLocked ? Icons.lock : Icons.lock_open,
                        label: 'Lock',
                        onTap: () => setState(() => isLocked = !isLocked),
                        color: isLocked
                            ? const Color(0xFFFF69B4)
                            : Colors.grey.shade700,
                      ),
                      _buildControlButton(
                        icon: Icons.fullscreen,
                        label: 'Extent',
                        onTap: () => setState(() => isExtended = !isExtended),
                        color: Colors.grey.shade700,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          if (isExtended)
            Positioned(
              top: 40,
              right: 20,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => setState(() => isExtended = false),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.fullscreen_exit,
                      color: Colors.black87,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showOpacitySlider() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        double localOpacity = opacity;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Adjust Opacity',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    value: localOpacity,
                    min: 0.0,
                    max: 1.0,
                    activeColor: const Color(0xFFFF69B4),
                    inactiveColor: Colors.grey.shade300,
                    onChanged: (value) {
                      setModalState(() => localOpacity = value);
                      setState(() => opacity = value);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(localOpacity * 100).toInt()}%',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF69B4),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
