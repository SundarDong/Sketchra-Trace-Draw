import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketchtrace/utils/app_routing/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp(
          title: 'Sketchra',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
