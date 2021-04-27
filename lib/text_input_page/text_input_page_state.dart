import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_input_page_state.freezed.dart';

@freezed
class TextInputPageState with _$TextInputPageState {
  const factory TextInputPageState({
    required String text
  }) = _TextInputPageState;
}
