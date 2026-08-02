import 'package:flutter/material.dart';

@immutable
class AppChartColors extends ThemeExtension<AppChartColors> {
  const AppChartColors({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
  });

  final Color systolic;
  final Color diastolic;
  final Color pulse;

  @override
  AppChartColors copyWith({Color? systolic, Color? diastolic, Color? pulse}) {
    return AppChartColors(
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      pulse: pulse ?? this.pulse,
    );
  }

  @override
  AppChartColors lerp(covariant AppChartColors? other, double t) {
    if (other == null) {
      return this;
    }

    return AppChartColors(
      systolic: Color.lerp(systolic, other.systolic, t)!,
      diastolic: Color.lerp(diastolic, other.diastolic, t)!,
      pulse: Color.lerp(pulse, other.pulse, t)!,
    );
  }
}
