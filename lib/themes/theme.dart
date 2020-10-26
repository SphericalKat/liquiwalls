import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';

final deepBlue = '040D27'.toColor();
final deepBlueSecondary = '132147'.toColor();
final electricBlue = '2C5BED'.toColor();
final lightGrey = 'F0F0F0'.toColor();

final InputDecorationTheme inputTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: electricBlue, width: 1.4),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: electricBlue, width: 1.4),
  ),
);

final ThemeData darkTheme = ThemeData(
  accentColor: Colors.pink,
  primaryColor: deepBlue,
  popupMenuTheme: PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  primaryColorDark: deepBlue,
  backgroundColor: deepBlue,
  scaffoldBackgroundColor: deepBlue,
  cardColor: deepBlueSecondary,
  applyElevationOverlayColor: true,
  brightness: Brightness.dark,
  inputDecorationTheme: inputTheme,
  toggleableActiveColor: electricBlue,
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Circular-Std'),
  bottomSheetTheme: BottomSheetThemeData(
    modalBackgroundColor: deepBlueSecondary,
    shape: RoundedRectangleBorder(),
  ),
  iconTheme: IconThemeData(color: Colors.white.withOpacity(0.7)),
  dialogTheme: DialogTheme(
    backgroundColor: deepBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    buttonColor: electricBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
);

final ThemeData lightTheme = ThemeData(
    accentColor: Colors.pink,
    toggleableActiveColor: electricBlue,
    primaryColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
    ),
    primaryColorDark: Colors.white,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: lightGrey,
    fontFamily: "Circular-Std",
    applyElevationOverlayColor: true,
    brightness: Brightness.light,
    inputDecorationTheme: inputTheme,
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: Colors.white, shape: RoundedRectangleBorder()),
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Circular-Std'),
    iconTheme: IconThemeData(color: Colors.black.withOpacity(0.7)),
    dialogTheme: DialogTheme(
      backgroundColor: deepBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      buttonColor: electricBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    pageTransitionsTheme:
        PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.scaled),
      TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.scaled),
    }));

final systemTheme = SystemUiOverlayStyle.light.copyWith(
  statusBarColor: Colors.transparent,
);
