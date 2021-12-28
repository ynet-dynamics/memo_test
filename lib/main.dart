import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'draw_controller.dart';


void main() => runApp(DrawScreen());

class DrawScreen extends HookWidget {
  const DrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _state = useProvider(drawController);
    final _controller = useProvider(drawController.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: GestureDetector(
              onPanStart: (details) =>
                  _controller.addPaint(details.localPosition),
              onPanUpdate: (details) {
                _controller.updatePaint(_getPosition(
                    MediaQuery.of(context).size.width, details.localPosition));
              },
              onPanEnd: (_) => _controller.endPaint(),
              child: CustomPaint(painter: Signature(_state, context)),
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _controller.undo,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: _controller.canUndo
                      ? Theme.of(context).accentColor
                      : Colors.grey[200],
                  onPrimary: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                child: const Icon(Icons.undo, size: 40),
              ),
              ElevatedButton(
                onPressed: _controller.redo,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: _controller.canRedo
                      ? Theme.of(context).accentColor
                      : Colors.grey[200],
                  padding: const EdgeInsets.all(10),
                  onPrimary: Colors.white,
                ),
                child: const Icon(Icons.redo, size: 40),
              ),
              ElevatedButton(
                onPressed: _controller.clear,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: Colors.red,
                  padding: const EdgeInsets.all(10),
                  onPrimary: Colors.white,
                ),
                child: const Icon(Icons.delete, size: 40),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  // ポジションの取得
  Offset _getPosition(double length, Offset localPosition) {
    double _dx;
    double _dy;
    if (localPosition.dx < 0) {
      _dx = 0;
    } else if (localPosition.dx > length) {
      _dx = length;
    } else {
      _dx = localPosition.dx;
    }
    if (localPosition.dy < 0) {
      _dy = 0;
    } else if (localPosition.dy > length) {
      _dy = length;
    } else {
      _dy = localPosition.dy;
    }
    return Offset(_dx, _dy);
  }
}

class Signature extends CustomPainter {
  Signature(this.state, this.context);

  final DrawState state;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWigth = 12.0;

    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWigth;

    for (final points in state.paintList) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: points[0], width: strokeWigth, height: strokeWigth),
          const Radius.circular(strokeWigth),
        ),
        paint,
      );
      for (var i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) =>
      oldDelegate.state.paintList != state.paintList;
}

