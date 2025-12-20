export "package:flutter/material.dart";
import "package:sketchtrace/common/screens/splash_screen.dart";
import "package:sketchtrace/models/topic_model.dart";
import "package:sketchtrace/utils/app_routing/app_routes.dart";

import "routing_imports.dart";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _animatedRoute(const SplashScreen());

      case AppRoutes.drawScreenRoute:
        return _animatedRoute(const DrawingTopicsScreen());

      case AppRoutes.guideScreenRoute:
        return _animatedRoute(const GuideScreen());

      case AppRoutes.settingScreenRoute:
        return _animatedRoute(const SettingsScreen());

      case AppRoutes.topicCollectionScreenRoute:
        final topic = settings.arguments as TopicModel;
        return _animatedRoute(TopicCollectionScreen(topic: topic));

      case AppRoutes.selectModeScreenRoute:
        final imagePath = settings.arguments as String;
        return _animatedRoute(SelectModeScreen(imagePath: imagePath));
      case AppRoutes.sketchModeScreenRoute:
        final sketchImagePath = settings.arguments as String;
        return _animatedRoute(SketchScreen(imagePath: sketchImagePath));

      case AppRoutes.traceModeScreenRoute:
        final traceImagePath = settings.arguments as String;
        return _animatedRoute(TraceScreen(imagePath: traceImagePath));

      default:
        return _animatedRoute(const SplashScreen());
    }
  }

  static PageRouteBuilder<dynamic> _animatedRoute(Widget childPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => childPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.linear;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
        // return FadeTransition(opacity: curvedAnimation, child: child);
        // return ScaleTransition(
        //   scale: CurvedAnimation(parent: animation, curve: Curves.ease),
        //   child: child,
        // );
      },
      transitionDuration: Duration(milliseconds: 300),
      reverseTransitionDuration: Duration(milliseconds: 300),
    );
  }
}
