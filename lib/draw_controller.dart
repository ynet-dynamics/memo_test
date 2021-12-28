import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'draw_controller.freezed.dart';

// ステート
@freezed
abstract class DrawState with _$DrawState {
  const factory DrawState({
    @Default(<List<Offset>>[]) List<List<Offset>> paintList,
    @Default(<List<Offset>>[]) List<List<Offset>> undoList,
    @Default(false) bool isDrag,
  }) = _DrawState;
}

// コントローラー
final drawController =
StateNotifierProvider.autoDispose<DrawController, DrawState>(
        (ref) => DrawController());

class DrawController extends StateNotifier<DrawState> {
  DrawController() : super(const DrawState());

  bool get canUndo => state.paintList.isNotEmpty;
  bool get canRedo => state.undoList.isNotEmpty;

  void undo() {
    // 描画中か、undoできなかったら何もしない
    if (state.isDrag || !canUndo) {
      return;
    }
    // paintListの最後を取って、undoListに追加する
    final _last = state.paintList.last;
    state = state.copyWith(
      undoList: List.of(state.undoList)..add(_last),
      paintList: List.of(state.paintList)..removeLast(),
    );
  }

  void redo() {
    // 描画中か、redoできなかったら何もしない
    if (state.isDrag || !canRedo) {
      return;
    }
    // undoListの最後を取って、paintListに追加する
    final _last = state.undoList.last;
    state = state.copyWith(
      undoList: List.of(state.undoList)..removeLast(),
      paintList: List.of(state.paintList)..add(_last),
    );
  }

  void clear() {
    if (!state.isDrag) {
      state = state.copyWith(paintList: [], undoList: []);
    }
  }

  void addPaint(Offset startPoint) {
    if (!state.isDrag) {
      state = state.copyWith(
        isDrag: true,
        paintList: List.of(state.paintList)..add([startPoint]),
        undoList: const [],
      );
    }
  }

  void updatePaint(Offset nextPoint) {
    if (state.isDrag) {
      final _paintList = List<List<Offset>>.of(state.paintList);
      final _offsetList = List<Offset>.of(state.paintList.last)..add(nextPoint);
      _paintList.last = _offsetList;

      state = state.copyWith(paintList: _paintList);
    }
  }

  void endPaint() => state = state.copyWith(isDrag: false);
}