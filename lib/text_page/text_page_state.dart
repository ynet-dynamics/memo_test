import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_page_state.freezed.dart';

@freezed
class TextPageState with _$TextPageState {
  const factory TextPageState({
    required String text
  }) = _TextPageState;
}
