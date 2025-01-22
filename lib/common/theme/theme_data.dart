import 'package:flutter/material.dart';
import 'package:water_tracking/common/theme/card_theme_data.dart';
import 'package:water_tracking/common/theme/color_palette.dart';
import 'package:water_tracking/common/theme/text_theme.dart';
// import 'package:google_fonts/google_fonts.dart';

final material3LightTheme = buildTheme(lightColorScheme);

final material3DarkTheme = buildTheme(darkColorScheme);

ThemeData buildTheme(ColorScheme colorScheme) {
  // final useGoogleFonts = FlavorConfig.values.useGoogleFonts;
  final textTheme = getTextTheme(colorScheme);
  return ThemeData(
    useMaterial3: true,
    textTheme: textTheme,
    // textTheme:
    //     useGoogleFonts ? GoogleFonts.openSansTextTheme(textTheme) : textTheme,
    // fontFamily: useGoogleFonts ? GoogleFonts.openSans().fontFamily : null,
    popupMenuTheme: PopupMenuThemeData(color: colorScheme.surface),
    cardTheme: AppCardTheme(cardColor: colorScheme.surface),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorScheme.surface),
    appBarTheme: AppBarTheme(color: colorScheme.surfaceVariant),
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.background,
  );
}
