import 'package:dark_theme_sample/providers/material_provider.dart';
import 'package:dark_theme_sample/providers/theme_provider.dart';
import 'package:dark_theme_sample/widget/showcase_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final materialNotifier = ref.watch(materialDesignNotifierProvider);

    final materialButton = IconButton(
        onPressed: () {
          final notifier = ref.read(materialDesignNotifierProvider.notifier);
          notifier.changeMaterialDesign();
        },
        icon: materialNotifier
            ? const Icon(Icons.filter_3)
            : const Icon(Icons.filter_2));

    final themeButton = IconButton(
        icon: theme == ThemeMode.dark
            ? const Icon(Icons.light_mode)
            : const Icon(
                Icons.dark_mode,
              ),
        onPressed: () {
          final notifier = ref.read(themeProvider.notifier);
          notifier.switchTheme(
              theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
        });

    return Scaffold(
      appBar: AppBar(
        actions: [
          materialButton,
          themeButton,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          primary: true,
          children: const [ShowcaseMaterial()],
        ),
      ),
    );
  }
}
