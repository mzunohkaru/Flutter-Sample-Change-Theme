import 'package:dark_theme_sample/providers/provider.dart';
import 'package:dark_theme_sample/providers/provider_material.dart';
import 'package:dark_theme_sample/widget/showcase_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);
    final materialNotifier = ref.watch(materialDesignNotifierProvider);

    ref.listen(
      themeNotifierProvider,
      (oldState, newState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('テーマカラーが変更されました'),
          ),
        );
      },
    );

    final materialButton = IconButton(
        onPressed: () {
          final notifier = ref.read(materialDesignNotifierProvider.notifier);
          notifier.changeMaterialDesign();
        },
        icon: materialNotifier
            ? const Icon(Icons.filter_3)
            : const Icon(Icons.filter_2));

    final themeButton = IconButton(
        onPressed: () {
          final notifier = ref.read(themeNotifierProvider.notifier);
          notifier.changeThemeSystem();
        },
        icon: themeNotifier
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode));

    // 縦に並べる
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
