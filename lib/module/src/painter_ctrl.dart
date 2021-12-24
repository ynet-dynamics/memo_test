import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'paint_history.dart';

/*
 * ペイントコントローラ
 */
class PaintController extends ChangeNotifier {

  // ペイント履歴
  final PaintHistory paintHistory = PaintHistory();

  /*
   * コンストラクタ
   */
  PaintController() : super() {

    // ペイント設定
    Paint paint = getPaint(
      color: const Color.fromARGB(255, 0, 0, 0),
      strokeWidth: 5.0
    );

    _init(paint);
  }

  void _init (Paint paint) {
    paintHistory.currentPaint = paint;
    paintHistory.backgroundColor = const Color.fromARGB(255, 255, 255, 255);
  }

  void changePenSize(double input) {

    paintHistory.currentPaint = getPaint(
        color: paintHistory.currentPaint.color,
        strokeWidth: input
    );

    notifyListeners();
  }

  Paint getPaint ({
    required Color color,
    required double strokeWidth
    }) {

    // ペイント設定
    Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

     return paint;
  }

  /*
   * undo実行
   */
  void undo() {

    paintHistory.undo();
    notifyListeners();
  }

  /*
   * redo実行
   */
  void redo() {

    paintHistory.redo();
    notifyListeners();
  }

  /*
   * undo可能か
   */
  bool get canUndo => paintHistory.canUndo();

  /*
   * redo可能か
   */
  bool get canRedo => paintHistory.canRedo();

  /*
   * リスナー実行
   */
  void notifyListeners1() {

    notifyListeners();
  }

  /*
   * クリア
   */
  void clear() {

    paintHistory.clear();
    notifyListeners();
  }
}