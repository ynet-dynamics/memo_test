import 'package:page_transaction/model/platform/platform_text.dart';
import 'package:riverpod/riverpod.dart';

import 'text_page_state.dart';

class TextPageController extends StateNotifier<TextPageState> {
  TextPageController() : super(const TextPageState(text: "")) {
    PlatformText.textHandler((text) {
      state = state.copyWith.call(text: text);
    });
  }

  Future<void> onTapLaunchTextScreen() async {
    await PlatformText.launchTextScreen();
  }
}
