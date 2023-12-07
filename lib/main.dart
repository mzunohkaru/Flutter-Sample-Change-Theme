import 'package:dark_theme_sample/providers/provider.dart';
import 'package:dark_theme_sample/providers/provider_material.dart';
import 'package:dark_theme_sample/ui/view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  FlexScheme usedScheme = FlexScheme.blueWhale;
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);
    final materialNotifier = ref.watch(materialDesignNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: themeNotifier
            ? FlexThemeData.light(
                scheme: usedScheme,
                appBarElevation: 0.5,
                useMaterial3: materialNotifier,
                typography:
                    Typography.material2021(platform: defaultTargetPlatform),
              )
            : FlexThemeData.dark(
                scheme: usedScheme,
                appBarElevation: 2,
                useMaterial3: materialNotifier,
                typography:
                    Typography.material2021(platform: defaultTargetPlatform),
              ),
        themeMode: themeMode,
        home: const MainView());
  }
}
