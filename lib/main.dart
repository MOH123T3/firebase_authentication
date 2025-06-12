import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/routes/app_routes.dart';
import 'package:test_app/view/start_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp().then((value) {
  print('Firebase initialized successfully');
}).catchError((e) {
  print('Firebase init error: $e');
});

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.firstScreen,
          getPages: AppPages.appPages,
        );
      },
    );
  }
}
