// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'text_input_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TextInputPageStateTearOff {
  const _$TextInputPageStateTearOff();

  _TextInputPageState call({required String text}) {
    return _TextInputPageState(
      text: text,
    );
  }
}

/// @nodoc
const $TextInputPageState = _$TextInputPageStateTearOff();

/// @nodoc
mixin _$TextInputPageState {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextInputPageStateCopyWith<TextInputPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextInputPageStateCopyWith<$Res> {
  factory $TextInputPageStateCopyWith(
          TextInputPageState value, $Res Function(TextInputPageState) then) =
      _$TextInputPageStateCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$TextInputPageStateCopyWithImpl<$Res>
    implements $TextInputPageStateCopyWith<$Res> {
  _$TextInputPageStateCopyWithImpl(this._value, this._then);

  final TextInputPageState _value;
  // ignore: unused_field
  final $Res Function(TextInputPageState) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TextInputPageStateCopyWith<$Res>
    implements $TextInputPageStateCopyWith<$Res> {
  factory _$TextInputPageStateCopyWith(
          _TextInputPageState value, $Res Function(_TextInputPageState) then) =
      __$TextInputPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class __$TextInputPageStateCopyWithImpl<$Res>
    extends _$TextInputPageStateCopyWithImpl<$Res>
    implements _$TextInputPageStateCopyWith<$Res> {
  __$TextInputPageStateCopyWithImpl(
      _TextInputPageState _value, $Res Function(_TextInputPageState) _then)
      : super(_value, (v) => _then(v as _TextInputPageState));

  @override
  _TextInputPageState get _value => super._value as _TextInputPageState;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_TextInputPageState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_TextInputPageState implements _TextInputPageState {
  const _$_TextInputPageState({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'TextInputPageState(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TextInputPageState &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$TextInputPageStateCopyWith<_TextInputPageState> get copyWith =>
      __$TextInputPageStateCopyWithImpl<_TextInputPageState>(this, _$identity);
}

abstract class _TextInputPageState implements TextInputPageState {
  const factory _TextInputPageState({required String text}) =
      _$_TextInputPageState;

  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TextInputPageStateCopyWith<_TextInputPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
