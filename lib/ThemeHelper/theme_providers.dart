import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) => AppThemeState());

class AppThemeState extends ChangeNotifier{
  var isDark =false;
  void setLightTheme(){
    isDark =false;
    notifyListeners();
  }

  void setDarkTheme(){
    isDark = true;
    notifyListeners();
  }
}