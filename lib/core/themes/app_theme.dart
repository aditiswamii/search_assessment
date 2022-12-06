import 'package:flutter/material.dart';

final ThemeData _theme = _buildTheme();

class AppTheme {
  static var scaffoldBackground = const Color(0xFFFFFFFF);
  static double cardRadiusInt = 10;
  static BorderRadiusGeometry cardRadius =
      BorderRadius.all(Radius.circular(cardRadiusInt));
  static BorderRadius clipRadius =
      BorderRadius.all(Radius.circular(cardRadiusInt));

  static Color appWhite = const Color(0xFFffffff);
  static Color appBlack = const Color(0xFF000000);
  static Color appGrey = const Color(0xFF777777);

  Gradient get appGradient => const LinearGradient(
        colors: [Color(0xFF5A5A5A), Color(0xffffffff)],
        stops: [0, 1],
        begin: Alignment(-0.96, 0.28),
        end: Alignment(0.96, -0.28),
        // angle: 74,
        // scale: undefined,
      );

  ThemeData getThemeData(BuildContext context) {
    return _theme;
  }
}

ThemeData _buildTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: base.colorScheme.copyWith(
      primary: const Color(0xFFef3f3f),
      secondary: const Color(0xFFef3f3f),
      brightness: Brightness.light,
    ),
    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1!.copyWith(
      fontFamily: 'Roboto',
    ),
    headline2: base.headline2!.copyWith(
      fontFamily: 'Roboto',
    ),
    headline3: base.headline3!.copyWith(
      fontFamily: 'Roboto',
    ),
    headline4: base.headline4!.copyWith(
      fontFamily: 'Roboto',
    ),
    headline5: base.headline5!.copyWith(
      fontFamily: 'Roboto',
    ),
    headline6: base.headline6!.copyWith(
      fontFamily: 'Roboto',
      fontSize: 26,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontFamily: 'Roboto',
    ),
    subtitle2: base.subtitle2!.copyWith(
      fontFamily: 'Roboto',
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontFamily: 'Roboto',
    ),
    bodyText2: base.bodyText2!.copyWith(
      fontFamily: 'Roboto',
    ),
    caption: base.caption!.copyWith(
      fontFamily: 'Roboto',
    ),
    button: base.button!.copyWith(
      fontFamily: 'Roboto',
    ),
    overline: base.overline!.copyWith(
      fontFamily: 'Roboto',
    ),
  );
}
