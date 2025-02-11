//color red = c10121
//color background = f8fafb
// color card = ffffff
// vermelho mais escuro = a7000d
// alert = e00e2c

import 'package:flutter/material.dart';
import 'package:guia_moteis/infra/theme/default_colors.dart';

class CustomThemes {
  static final defaultTheme = ThemeData(
    fontFamily: 'TitilliumWeb',
    colorScheme: const ColorScheme(
      onSecondary: AppColors.secondaryWhite,
      onError: AppColors.errorColor,
      error: AppColors.errorColor,
      brightness: Brightness.light,
      onPrimary: AppColors.primaryColor,
      surface: AppColors.primaryColor,
      secondary: AppColors.backgroundGray,
      primary: AppColors.primaryColor,
      onSurface: AppColors.secondaryRed,
      tertiary: AppColors.primaryGray,
      outline: AppColors.borderColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        color: AppColors.textColor,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        color: AppColors.textColor,
      ),
      displayMedium: TextStyle(
        color: AppColors.textColor,
      ),
      displaySmall: TextStyle(
        color: AppColors.textColor,
      ),
      headlineSmall: TextStyle(
        color: AppColors.textColor,
      ),
    ),
  );
}
