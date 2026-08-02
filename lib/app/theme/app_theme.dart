import 'package:flutter/material.dart';

import 'package:blood_pressure_app/app/theme/app_color_scheme.dart';
import 'package:blood_pressure_app/app/theme/app_text_theme.dart';
import 'package:blood_pressure_app/design_system/extensions/app_chart_colors.dart';
import 'package:blood_pressure_app/design_system/tokens/app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorScheme.light,
    textTheme: AppTextTheme.textTheme,
    scaffoldBackgroundColor: AppColors.lightBackground,
    extensions: const <ThemeExtension<dynamic>>[
      AppChartColors(
        systolic: AppColors.lightChartSystolic,
        diastolic: AppColors.lightChartDiastolic,
        pulse: AppColors.lightChartPulse,
      ),
    ],
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorScheme.dark,
    textTheme: AppTextTheme.textTheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    extensions: const <ThemeExtension<dynamic>>[
      AppChartColors(
        systolic: AppColors.darkChartSystolic,
        diastolic: AppColors.darkChartDiastolic,
        pulse: AppColors.darkChartPulse,
      ),
    ],
  );
}
