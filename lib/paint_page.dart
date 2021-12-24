import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'painter.dart';

class PaintPage extends StatefulHookWidget {
  const PaintPage({Key? key}) : super(key: key);
  @override
  _PaintPageState createState() => _PaintPageState();
}


class _PaintPageState extends State<PaintPage> {

  // コントローラ
  final PaintController _controller = PaintController();

  @override
  Widget build(BuildContext context) {

    //List penSize = ['small','middle','large'];

    return Scaffold(

      appBar: AppBar(),

      body: Container(
        child: Painter(
          paintController: _controller,
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          FloatingActionButton(
            heroTag: "back",
            onPressed: () {
              back(context);

            },
            child: const Text("back"),
          ),

          const SizedBox(
            height: 20.0,
          ),


          // ペンサイズボタン
          FloatingActionButton(
            heroTag: "size",
            onPressed: () {
              _controller.changePenSize();
            },
            child: const Text("size"),
          ),

          const SizedBox(
            height: 20.0,
          ),

          // undoボタン
          FloatingActionButton(
            heroTag: "undo",
            onPressed: () {
              if (_controller.canUndo) _controller.undo();
            },
            child: const Text("undo"),
          ),

          const SizedBox(
            height: 20.0,
          ),

          // redoボタン
          FloatingActionButton(
            heroTag: "redo",
            onPressed: () {
              if (_controller.canRedo) _controller.redo();
            },
            child: const Text("redo"),
          ),

          const SizedBox(
            height: 20.0,
          ),

          // クリアボタン
          FloatingActionButton(
            heroTag: "clear",
            onPressed: () => _controller.clear(),
            child: const Text("clear"),
          ),
        ],
      ),
    );
  }

}

void back (BuildContext context) async {
  Navigator.pop(context);
}

