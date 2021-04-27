import 'package:flutter_channel_practice/model/platform/platform_text_input.dart';
import 'package:riverpod/riverpod.dart';

import 'text_input_page_state.dart';

class TextInputPageController extends StateNotifier<TextInputPageState> {
  TextInputPageController() : super(const TextInputPageState(text: "")) {
    PlatformTextInput.textHandler((text) {
      state = state.copyWith.call(text: text);
    });
  }

  Future<void> onTapLaunchTextScreen() async {
    await PlatformTextInput.launchTextScreen();
  }
}
