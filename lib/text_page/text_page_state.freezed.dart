// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'text_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TextPageStateTearOff {
  const _$TextPageStateTearOff();

  _TextPageState call({required String text}) {
    return _TextPageState(
      text: text,
    );
  }
}

/// @nodoc
const $TextPageState = _$TextPageStateTearOff();

/// @nodoc
mixin _$TextPageState {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextPageStateCopyWith<TextPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextPageStateCopyWith<$Res> {
  factory $TextPageStateCopyWith(
          TextPageState value, $Res Function(TextPageState) then) =
      _$TextPageStateCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$TextPageStateCopyWithImpl<$Res>
    implements $TextPageStateCopyWith<$Res> {
  _$TextPageStateCopyWithImpl(this._value, this._then);

  final TextPageState _value;
  // ignore: unused_field
  final $Res Function(TextPageState) _then;

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
abstract class _$TextPageStateCopyWith<$Res>
    implements $TextPageStateCopyWith<$Res> {
  factory _$TextPageStateCopyWith(
          _TextPageState value, $Res Function(_TextPageState) then) =
      __$TextPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class __$TextPageStateCopyWithImpl<$Res>
    extends _$TextPageStateCopyWithImpl<$Res>
    implements _$TextPageStateCopyWith<$Res> {
  __$TextPageStateCopyWithImpl(
      _TextPageState _value, $Res Function(_TextPageState) _then)
      : super(_value, (v) => _then(v as _TextPageState));

  @override
  _TextPageState get _value => super._value as _TextPageState;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_TextPageState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$_TextPageState implements _TextPageState {
  const _$_TextPageState({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'TextPageState(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TextPageState &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$TextPageStateCopyWith<_TextPageState> get copyWith =>
      __$TextPageStateCopyWithImpl<_TextPageState>(this, _$identity);
}

abstract class _TextPageState implements TextPageState {
  const factory _TextPageState({required String text}) = _$_TextPageState;

  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TextPageStateCopyWith<_TextPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
