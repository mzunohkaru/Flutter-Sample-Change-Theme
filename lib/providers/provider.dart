import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  bool build() {
    return true;
  }

  void changeThemeSystem() {
    state = !state;
  }
}


