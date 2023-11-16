import 'package:dark_theme_sample/repository/provider.dart';
import 'package:dark_theme_sample/ui/view.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);
    return MaterialApp(
        theme: themeNotifier
            ? FlexThemeData.dark(scheme: FlexScheme.blueWhale)
            : FlexThemeData.light(scheme: FlexScheme.blueWhale),
        home: const MainView());
  }
}
