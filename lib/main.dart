import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/role_selection_screen.dart';

void main() {
  runApp(const MedNestApp());
}

class MedNestApp extends StatelessWidget {
  const MedNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedNEST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: 'Segoe UI', // Fallback font
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
        ),
      ),
      home: const RoleSelectionScreen(),
    );
  }
}
