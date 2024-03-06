import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qrgenerator/Pages/home_page.dart';
import 'package:qrgenerator/widgets/theme_changer.dart';

import 'ThemeHelper/theme_constrant.dart';
import 'ThemeHelper/theme_providers.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
  
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: appThemeState.isDark? ThemeMode.dark:ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

