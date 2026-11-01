import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color greenDarkest = Color(0xFF0F2E24);
  static const Color greenDark = Color(0xFF1A3A2F);
  static const Color greenMedium = Color(0xFF2D4A3E);

  static const Color gold = Color(0xFFE8B04A);
  static const Color goldLight = Color(0xFFFFE4B5);
  static const Color goldDark = Color(0xFFC77A1A);

  static const Color orangeSun = Color(0xFFFFB347);
  static const Color orange = Color(0xFFF2994A);
  static const Color orangeDeep = Color(0xFFFF6B35);
  static const Color red = Color(0xFFE63946);
  static const Color redSoft = Color(0xFFEB5757);

  static const Color cream = Color(0xFFFFF8EC);
  static const Color beige = Color(0xFFF5ECD7);
  static const Color beigeSoft = Color(0xBFCDBBA3);
  static const Color taupe = Color(0xFF7A6A52);
  static const Color taupeMuted = Color(0xFF8A7A5C);
  static const Color brownMuted = Color(0xFF9A8C72);

  static const Color liveRed = Color(0xFFE63946);
  static const Color liveRedGlow = Color(0x80E63946);

  static const Color orangeBtnGlow = Color(0x80FF6B35);

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [greenMedium, greenDark, greenDarkest],
  );

  static const LinearGradient fabGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [orangeSun, orangeDeep],
  );

  static const LinearGradient warmEventGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [orange, redSoft],
  );

  static const LinearGradient greenEventGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [greenDarkest, greenMedium],
  );

  static const List<Color> attendeeColors = [
    Color(0xFFE67E22),
    Color(0xFFC0392B),
    Color(0xFF27AE60),
    Color(0xFF2980B9),
    Color(0xFF8E44AD),
  ];
}

class AppTextStyles {
  AppTextStyles._();

  static const String _serif = 'Serif';

  static TextStyle serifDisplay({
    double fontSize = 32,
    FontWeight weight = FontWeight.w900,
    Color color = Colors.white,
    double height = 1.1,
    FontStyle? style,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _serif,
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      height: height,
      fontStyle: style,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle body({
    double fontSize = 14,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.greenDarkest,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle tag({
    double fontSize = 12,
    FontWeight weight = FontWeight.w700,
    Color color = AppColors.gold,
    double letterSpacing = 1.5,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle sectionTitle = serifDisplay(
    fontSize: 26,
    weight: FontWeight.w800,
    color: AppColors.greenDarkest,
  );

  static TextStyle serifItalic = serifDisplay(
    fontSize: 26,
    weight: FontWeight.w500,
    color: AppColors.beige,
    style: FontStyle.italic,
    height: 1.15,
  );

  static TextStyle navLabel({
    required bool active,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
      color: active ? AppColors.greenDarkest : AppColors.brownMuted,
    );
  }
}

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenDarkest),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.cream,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.greenDarkest),
        bodyMedium: TextStyle(color: AppColors.greenDarkest),
      ),
    );
  }
}
