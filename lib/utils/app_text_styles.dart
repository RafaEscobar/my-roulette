import 'package:flutter/material.dart';
import 'package:myroulette/theme/app_theme.dart';

class AppTextStyles {
  static TextStyle outlineText({required double fontSize}) => TextStyle(
    fontSize: fontSize,
    color: AppTheme.primaryPurple,
    fontWeight: FontWeight.bold,
    shadows: const [
      Shadow(offset: Offset(-1, -1), blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, -1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(-1, 1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, 1),   blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(0, -1),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(0, 1),   blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(-1, 0),  blurRadius: 0, color: Colors.white70),
      Shadow(offset: Offset(1, 0),   blurRadius: 0, color: Colors.white70),
    ],
  );
}
