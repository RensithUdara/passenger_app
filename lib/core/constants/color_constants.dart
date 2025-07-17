import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF2196F3); // Blue
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryVariant = Color(0xFF3F51B5);

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF4CAF50); // Green
  static const Color secondaryLight = Color(0xFF81C784);
  static const Color secondaryDark = Color(0xFF388E3C);

  // Safety Colors
  static const Color safeColor = Color(0xFF4CAF50); // Green
  static const Color warningColor = Color(0xFFFF9800); // Orange
  static const Color dangerColor = Color(0xFFF44336); // Red
  static const Color criticalColor = Color(0xFF9C27B0); // Purple

  // Status Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);
  static const Color warningColorAlt = Color(0xFFFF9800);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);
  static const Color greyExtraLight = Color(0xFFF5F5F5);

  // Background Colors
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF2C2C2C);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, primaryDark],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [successColor, Color(0xFF2E7D32)],
  );

  static const LinearGradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [warningColor, Color(0xFFE65100)],
  );

  static const LinearGradient dangerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [dangerColor, Color(0xFFD32F2F)],
  );

  // Bus Status Colors
  static const Color busOnline = Color(0xFF4CAF50);
  static const Color busOffline = Color(0xFF9E9E9E);
  static const Color busInTransit = Color(0xFF2196F3);
  static const Color busAtStop = Color(0xFFFF9800);
  static const Color busEmergency = Color(0xFFF44336);
  static const Color busMaintenance = Color(0xFF9C27B0);

  // Driver Status Colors
  static const Color driverActive = Color(0xFF4CAF50);
  static const Color driverResting = Color(0xFFFF9800);
  static const Color driverOffDuty = Color(0xFF9E9E9E);
  static const Color driverAlert = Color(0xFFF44336);

  // Safety Score Colors
  static const Color safetyExcellent = Color(0xFF4CAF50); // 90-100
  static const Color safetyGood = Color(0xFF8BC34A); // 80-89
  static const Color safetyAverage = Color(0xFFFFEB3B); // 70-79
  static const Color safetyPoor = Color(0xFFFF9800); // 60-69
  static const Color safetyCritical = Color(0xFFF44336); // Below 60

  // Map Colors
  static const Color routeColorActive = Color(0xFF2196F3);
  static const Color routeColorInactive = Color(0xFF9E9E9E);
  static const Color hazardZoneColor = Color(0x80F44336);
  static const Color safeZoneColor = Color(0x804CAF50);

  // Transparent Colors
  static const Color transparent = Colors.transparent;
  static const Color blackTransparent = Color(0x80000000);
  static const Color whiteTransparent = Color(0x80FFFFFF);

  // Shadow Colors
  static const Color shadowLight = Color(0x1F000000);
  static const Color shadowMedium = Color(0x3D000000);
  static const Color shadowDark = Color(0x5C000000);
}

// Color utility methods
extension AppColorsExtension on AppColors {
  static Color getSafetyColor(double score) {
    if (score >= 90) return AppColors.safetyExcellent;
    if (score >= 80) return AppColors.safetyGood;
    if (score >= 70) return AppColors.safetyAverage;
    if (score >= 60) return AppColors.safetyPoor;
    return AppColors.safetyCritical;
  }

  static Color getBusStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'online':
      case 'active':
        return AppColors.busOnline;
      case 'in_transit':
      case 'moving':
        return AppColors.busInTransit;
      case 'at_stop':
      case 'stopped':
        return AppColors.busAtStop;
      case 'emergency':
        return AppColors.busEmergency;
      case 'maintenance':
        return AppColors.busMaintenance;
      default:
        return AppColors.busOffline;
    }
  }

  static Color getDriverStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'driving':
        return AppColors.driverActive;
      case 'resting':
      case 'break':
        return AppColors.driverResting;
      case 'alert':
      case 'drowsy':
      case 'distracted':
        return AppColors.driverAlert;
      default:
        return AppColors.driverOffDuty;
    }
  }

  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  static Color lighten(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static Color darken(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
