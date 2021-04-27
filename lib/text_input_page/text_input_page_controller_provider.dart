import 'package:flutter_channel_practice/text_input_page/text_input_page_controller.dart';
import 'package:riverpod/riverpod.dart';
import 'text_input_page_state.dart';

final textInputPageControllerProvider =
    StateNotifierProvider<TextInputPageController, TextInputPageState>(
        (ref) => TextInputPageController());
