import 'package:dark_theme_sample/repository/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final themeButton = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(themeNotifierProvider.notifier);
        notifier.changeThemeSystem();
      },
      child: const Text('Change to Theme Color'),
    );

    // 縦に並べる
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          themeButton,
        ],
      ),
    );
  }
}
