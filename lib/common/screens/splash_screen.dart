import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _rotateController;
  late AnimationController _fadeController;

  late Animation<double> _horizontalAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _textFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Bounce animation controller
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Rotate animation controller
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Horizontal movement (left to center with bounces)
    _horizontalAnimation = TweenSequence<double>([
      // First big bounce from left
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -400.0,
          end: 50.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      // Bounce back
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 50.0,
          end: -30.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),
      // Second bounce
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -30.0,
          end: 15.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),
      // Final settle
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 15.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(_bounceController);

    // Vertical bouncing effect (ping pong up and down)
    _verticalAnimation = TweenSequence<double>([
      // First bounce
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -60.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -60.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 15,
      ),
      // Second bounce
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -40.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -40.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 15,
      ),
      // Third small bounce
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: -20.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -20.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 10,
      ),
      // Final settle
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(_bounceController);

    // Rotation animation (spinning while bouncing)
    _rotateAnimation = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );

    // Logo fade in
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    // Text fade in (delayed)
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start animations
    _fadeController.forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      _bounceController.forward();
      _rotateController.forward();
    });

    // Navigate to home page after 3.5 seconds
    Timer(const Duration(milliseconds: 3500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _rotateController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade700, Colors.purple.shade600],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated logo with bounce and rotation
              AnimatedBuilder(
                animation: Listenable.merge([
                  _bounceController,
                  _rotateController,
                  _fadeController,
                ]),
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      _horizontalAnimation.value,
                      _verticalAnimation.value,
                    ),
                    child: Transform.rotate(
                      angle: _rotateAnimation.value * 3.14159,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          width: 180.w,
                          height: 180.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 25.r,
                                offset: Offset(
                                  0,
                                  15 - _verticalAnimation.value / 3,
                                ),
                                spreadRadius: 5.r,
                              ),
                            ],
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.r),
                              child: Image.asset(
                                'assets/logo/newlogo.png',
                                width: 150.w,
                                height: 150.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              50.verticalSpace,

              // Animated text
              AnimatedBuilder(
                animation: _fadeController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _textFadeAnimation,
                    child: Column(
                      children: [
                        // Company name
                        Text(
                          'Sketchra',
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.sp,
                          ),
                        ),
                        8.verticalSpace,
                        // Tagline
                        Text(
                          ' AR Trace & Draw',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white70,
                            letterSpacing: 1.5.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              50.verticalSpace,

              // Loading indicator
              AnimatedBuilder(
                animation: _fadeController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _textFadeAnimation,
                    child: SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 3.sp,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
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
