import 'package:evently/common/app_colors.dart';
import 'package:evently/common/widgets/custom_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightThem = ThemeData(
      dividerTheme: const DividerThemeData(color: AppColors.mainColor),
      hoverColor: AppColors.greyColor,
      highlightColor: AppColors.mainColor,
      dividerColor: AppColors.lightTextColor,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor, brightness: Brightness.light),
      scaffoldBackgroundColor: AppColors.secLightColor,
      textTheme: const TextTheme(
        bodySmall: CustomTextStyles.style14w400Black,
        bodyMedium: CustomTextStyles.style16w400Black,
        bodyLarge: CustomTextStyles.style18w400Black,
        labelSmall: CustomTextStyles.style14w500Black,
        labelMedium: CustomTextStyles.style16w500Black,
        labelLarge: CustomTextStyles.style18w500Black,
        titleSmall: CustomTextStyles.style14w700Black,
        titleMedium: CustomTextStyles.style16w700Black,
        titleLarge: CustomTextStyles.style18w700Black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: 'Rag', fontSize: 22, fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: AppColors.mainColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.mainColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white));
  static ThemeData darkThem = ThemeData(
      hoverColor: AppColors.mainColor,
      highlightColor: AppColors.secDarkColor,
      dividerColor: AppColors.ofwightTextColor,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor, brightness: Brightness.dark),
      textTheme: const TextTheme(
        bodySmall: CustomTextStyles.style14w400White,
        bodyMedium: CustomTextStyles.style16w400White,
        bodyLarge: CustomTextStyles.style18w400White,
        labelSmall: CustomTextStyles.style14w500White,
        labelMedium: CustomTextStyles.style16w500White,
        labelLarge: CustomTextStyles.style18w500White,
        titleSmall: CustomTextStyles.style14w700White,
        titleMedium: CustomTextStyles.style16w700White,
        titleLarge: CustomTextStyles.style18w700White,
      ),
      scaffoldBackgroundColor: AppColors.secDarkColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Rag', fontSize: 22, fontWeight: FontWeight.w500),
          iconTheme: IconThemeData(color: AppColors.mainColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.secDarkColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white));
}
