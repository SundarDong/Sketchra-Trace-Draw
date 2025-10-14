import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class SketchScreen extends StatefulWidget {
  final String imagePath;

  const SketchScreen({super.key, required this.imagePath});

  @override
  State<SketchScreen> createState() => _SketchScreenState();
}

class _SketchScreenState extends State<SketchScreen> {
  double opacity = 1.0;
  bool isLocked = false;
  bool isFlashOn = false;
  bool isExtended = false;

  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset _startFocalPoint = Offset.zero;
  double _startScale = 1.0;

  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null || !_isCameraInitialized) return;

    try {
      if (isFlashOn) {
        await _cameraController!.setFlashMode(FlashMode.off);
      } else {
        await _cameraController!.setFlashMode(FlashMode.torch);
      }
      setState(() {
        isFlashOn = !isFlashOn;
      });
    } catch (e) {
      debugPrint('Error toggling flash: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isCameraInitialized)
            Positioned.fill(child: CameraPreview(_cameraController!))
          else
            const Center(child: CircularProgressIndicator()),

          // ======= IMAGE OVERLAY (asset or file) =======
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
                      _topButton(
                        icon: Icons.arrow_back,
                        onTap: () => Navigator.pop(context),
                      ),
                      _topButton(icon: Icons.help_outline, onTap: () {}),
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
                      ),
                      _buildControlButton(
                        icon: isLocked ? Icons.lock : Icons.lock_open,
                        label: 'Lock',
                        onTap: () => setState(() => isLocked = !isLocked),
                      ),
                      _buildControlButton(
                        icon: isFlashOn ? Icons.flash_on : Icons.flash_off,
                        label: 'Flash',
                        onTap: _toggleFlash,
                      ),
                      _buildControlButton(
                        icon: Icons.fullscreen,
                        label: 'Extent',
                        onTap: () => setState(() => isExtended = !isExtended),
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
                child: _topButton(
                  icon: Icons.fullscreen_exit,
                  onTap: () => setState(() => isExtended = false),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _topButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
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
          builder: (BuildContext context, StateSetter setModalState) {
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
                      setModalState(() {
                        localOpacity = value;
                      });
                      setState(() {
                        opacity = value;
                      });
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
