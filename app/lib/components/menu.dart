import 'package:flutter/material.dart';

class AccessibilityMenu extends StatelessWidget {
  final bool isDarkTheme;
  final String language;
  final VoidCallback onThemeChange;
  final VoidCallback onLanguageChange;

  AccessibilityMenu({
    required this.isDarkTheme,
    required this.language,
    required this.onThemeChange,
    required this.onLanguageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(Icons.brightness_6), onPressed: onThemeChange),
        IconButton(icon: Icon(Icons.language), onPressed: onLanguageChange),
      ],
    );
  }
}
