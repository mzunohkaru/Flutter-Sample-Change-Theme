import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'material_provider.g.dart';


@riverpod
class MaterialDesignNotifier extends _$MaterialDesignNotifier {
  @override
  bool build() {
    return true;
  }

  void changeMaterialDesign() {
    state = !state;
  }
}