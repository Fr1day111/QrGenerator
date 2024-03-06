import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ThemeHelper/theme_providers.dart';

class ThemeChangerButton extends ConsumerWidget {
  const ThemeChangerButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeState = ref.watch(appThemeStateNotifier);
    return Switch(
       value: themeState.isDark, onChanged: (enabled) {
         if(enabled){
           themeState.setDarkTheme();
         } else{
           themeState.setLightTheme();
         }
    },
    );
  }
}