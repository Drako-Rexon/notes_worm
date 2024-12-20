import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sub_notes_app/core/config/theme/app_theme.dart';
import 'package:sub_notes_app/presentation/splash_screen/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
