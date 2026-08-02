import 'dart:ui' show FontFeature;

import 'package:flutter/widgets.dart' show FontWeight, TextStyle;

abstract final class AppTypography {
  static const String fontFamilyJapanese = 'Noto Sans JP';
  static const String fontFamilyLatin = 'Roboto';
  static const List<String> fontFamilyFallback = <String>[
    'Noto Sans JP',
    'Roboto',
    'Hiragino Sans',
    'Yu Gothic',
    'Meiryo',
  ];

  static const List<FontFeature> tabularFigures = <FontFeature>[
    FontFeature.tabularFigures(),
  ];

  // Display
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 56,
    height: 64 / 56,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 48,
    height: 56 / 48,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 40,
    height: 48 / 40,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // Headline
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // Title
  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    height: 22 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 18,
    height: 28 / 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 16,
    height: 22 / 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  // Domain specific
  static const TextStyle bloodPressureLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 48,
    height: 56 / 48,
    fontWeight: FontWeight.w700,
    fontFeatures: tabularFigures,
  );

  static const TextStyle bloodPressureMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w700,
    fontFeatures: tabularFigures,
  );

  static const TextStyle bloodPressureSmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600,
    fontFeatures: tabularFigures,
  );

  static const TextStyle pulseLarge = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
    fontFeatures: tabularFigures,
  );

  static const TextStyle pulseMedium = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
    fontFeatures: tabularFigures,
  );

  static const TextStyle pulseSmall = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 18,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
    fontFeatures: tabularFigures,
  );

  static const TextStyle unit = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle dateTime = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    fontFeatures: tabularFigures,
  );

  static const TextStyle inputNumber = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 40,
    height: 48 / 40,
    fontWeight: FontWeight.w600,
    fontFeatures: tabularFigures,
  );

  static const TextStyle graphAxis = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle graphTooltip = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle statisticsValue = TextStyle(
    fontFamily: fontFamilyJapanese,
    fontFamilyFallback: fontFamilyFallback,
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
    fontFeatures: tabularFigures,
  );
}
