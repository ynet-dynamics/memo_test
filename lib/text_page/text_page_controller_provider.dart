import 'package:page_transaction/text_page/text_page_controller.dart';
import 'package:riverpod/riverpod.dart';
import 'text_page_state.dart';

final textPageControllerProvider =
    StateNotifierProvider<TextPageController, TextPageState>(
        (ref) => TextPageController());
