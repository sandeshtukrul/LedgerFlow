import "package:business_transactions/config/constants/string_const.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF10B981),
      surfaceTint: Color(0xff006c49),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa7f3d0),
      onPrimaryContainer: Color(0xff00422b),
      secondary: Color(0xff0058be),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2170e4),
      onSecondaryContainer: Color(0xfffefcff),
      tertiary: Color(0xff6b38d4),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8455ef),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xFFF43F5E),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffdc2c4f),
      onErrorContainer: Color(0xfffffbff),
      surface: Colors.white,
      onSurface: Color(0xff0f172a),
      onSurfaceVariant: Color(0xff64748b),
      outline: Color(0xffe2e8f0),
      outlineVariant: Color(0xffbbcabf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xff4edea3),
      primaryFixed: Color(0xff6ffbbe),
      onPrimaryFixed: Color(0xff002113),
      primaryFixedDim: Color(0xff4edea3),
      onPrimaryFixedVariant: Color(0xff005236),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff004395),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff23005c),
      tertiaryFixedDim: Color(0xffd0bcff),
      onTertiaryFixedVariant: Color(0xff5516be),
      surfaceDim: Color(0xffdbd9db),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f5),
      surfaceContainer: Color(0xffefedef),
      surfaceContainerHigh: Color(0xffeae7e9),
      surfaceContainerHighest: Color(0xffe4e2e4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f29),
      surfaceTint: Color(0xff006c49),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff007d55),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003475),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff0e69dc),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4200a0),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7c4ce7),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff72001f),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd12348),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9fa),
      onSurface: Color(0xff101113),
      onSurfaceVariant: Color(0xff2c3932),
      outline: Color(0xff48564d),
      outlineVariant: Color(0xff627067),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xff4edea3),
      primaryFixed: Color(0xff007d55),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff006142),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff0e69dc),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0051b0),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7c4ce7),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff632ecd),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc7c6c8),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f3f5),
      surfaceContainer: Color(0xffeae7e9),
      surfaceContainerHigh: Color(0xffdedcde),
      surfaceContainerHighest: Color(0xffd3d1d3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003421),
      surfaceTint: Color(0xff006c49),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005438),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002a62),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004699),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff370086),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff571bc1),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5f0018),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff96002b),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9fa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff222f28),
      outlineVariant: Color(0xff3f4c44),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303032),
      inversePrimary: Color(0xff4edea3),
      primaryFixed: Color(0xff005438),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b26),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004699),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00306e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff571bc1),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e0097),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab8ba),
      surfaceBright: Color(0xfffbf9fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f0f2),
      surfaceContainer: Color(0xffe4e2e4),
      surfaceContainerHigh: Color(0xffd6d4d6),
      surfaceContainerHighest: Color(0xffc7c6c8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF34D399),
      surfaceTint: Color(0xff4edea3),
      onPrimary: Color(0xff003824),
      primaryContainer: Color(0xff10b981),
      onPrimaryContainer: Color(0xff00422b),
      secondary: Color(0xffadc6ff),
      onSecondary: Color(0xff002e6a),
      secondaryContainer: Color(0xff4d8eff),
      onSecondaryContainer: Color(0xff001c46),
      tertiary: Color(0xffd0bcff),
      onTertiary: Color(0xff3c0091),
      tertiaryContainer: Color(0xffa078ff),
      onTertiaryContainer: Color(0xff14003b),
      error: Color(0xfffb7185),
      onError: Color(0xff67001b),
      errorContainer: Color(0xffff516a),
      onErrorContainer: Color(0xff45000f),
      surface: Color(0xff0f172a),
      onSurface: Color(0xffe4e2e4),
      onSurfaceVariant: Color(0xff94a3b8),
      outline: Color(0xff334155),
      outlineVariant: Color(0xff3c4a42),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff006c49),
      primaryFixed: Color(0xff6ffbbe),
      onPrimaryFixed: Color(0xff002113),
      primaryFixedDim: Color(0xff4edea3),
      onPrimaryFixedVariant: Color(0xff005236),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff004395),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff23005c),
      tertiaryFixedDim: Color(0xffd0bcff),
      onTertiaryFixedVariant: Color(0xff5516be),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff39393b),
      surfaceContainerLowest: Color(0xff0d0e10),
      surfaceContainerLow: Color(0xff1b1b1d),
      surfaceContainer: Color(0xff1f2021),
      surfaceContainerHigh: Color(0xff292a2b),
      surfaceContainerHighest: Color(0xff343536),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff68f5b8),
      surfaceTint: Color(0xff4edea3),
      onPrimary: Color(0xff002c1c),
      primaryContainer: Color(0xff10b981),
      onPrimaryContainer: Color(0xff001c10),
      secondary: Color(0xffcfdcff),
      onSecondary: Color(0xff002455),
      secondaryContainer: Color(0xff4d8eff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe4d6ff),
      onTertiary: Color(0xff2f0075),
      tertiaryContainer: Color(0xffa078ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd1d3),
      onError: Color(0xff530014),
      errorContainer: Color(0xffff516a),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd1e0d5),
      outline: Color(0xffa7b5ab),
      outlineVariant: Color(0xff85948a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff005337),
      primaryFixed: Color(0xff6ffbbe),
      onPrimaryFixed: Color(0xff00150b),
      primaryFixedDim: Color(0xff4edea3),
      onPrimaryFixedVariant: Color(0xff003f29),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff00102e),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff003475),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff170041),
      tertiaryFixedDim: Color(0xffd0bcff),
      onTertiaryFixedVariant: Color(0xff4200a0),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff444446),
      surfaceContainerLowest: Color(0xff070709),
      surfaceContainerLow: Color(0xff1d1d1f),
      surfaceContainer: Color(0xff272829),
      surfaceContainerHigh: Color(0xff323234),
      surfaceContainerHighest: Color(0xff3d3d3f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbaffda),
      surfaceTint: Color(0xff4edea3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff49da9f),
      onPrimaryContainer: Color(0xff000e07),
      secondary: Color(0xffecefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa7c2ff),
      onSecondaryContainer: Color(0xff000a22),
      tertiary: Color(0xfff5edff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcdb7ff),
      onTertiaryContainer: Color(0xff100032),
      error: Color(0xffffeceb),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffadb2),
      onErrorContainer: Color(0xff210004),
      surface: Color(0xff131315),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe5f4e8),
      outlineVariant: Color(0xffb7c6bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e2e4),
      inversePrimary: Color(0xff005337),
      primaryFixed: Color(0xff6ffbbe),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff4edea3),
      onPrimaryFixedVariant: Color(0xff00150b),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff00102e),
      tertiaryFixed: Color(0xffe9ddff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd0bcff),
      onTertiaryFixedVariant: Color(0xff170041),
      surfaceDim: Color(0xff131315),
      surfaceBright: Color(0xff505052),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f2021),
      surfaceContainer: Color(0xff303032),
      surfaceContainerHigh: Color(0xff3b3b3d),
      surfaceContainerHighest: Color(0xff464748),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        fontFamily: proximaNovaFont,
        textTheme: textTheme.apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface,
            fontFamily: proximaNovaFont),
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
