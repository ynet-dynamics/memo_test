import 'package:draw_your_image/draw_your_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var _currentColor = Colors.black;
  var _currentWidth = 4.0;

  final _controller = DrawController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('draw_your_image example'),
      ),

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            //const SizedBox(height: 32),
            //const Text('DRAW WHAT YOU WANT!'),
            const SizedBox(height: 120),
            Expanded(
              child: Draw(
                  controller: _controller,
                  backgroundColor: Colors.white,
                  strokeColor: _currentColor,
                  strokeWidth: _currentWidth,
                  isErasing: false,
                  onConvertImage: (imageData) {

                    // do something with imageData
                  }
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              children: [Colors.black, Colors.blue, Colors.red].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: color,
                        child: Center(
                          child: _currentColor == color
                              ? Icon(
                            Icons.brush,
                            color: Colors.white,
                          )
                              : SizedBox.shrink(),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 5),
            Slider(
              max: 40,
              min: 1,
              value: _currentWidth,
              onChanged: (value) {
                setState(() {
                  _currentWidth = value;
                });
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
        FloatingActionButton(
          heroTag: "undo",
            onPressed: () {
              _controller.undo();
           },
          child: const Text("undo"),
        ),

        const SizedBox(
          height: 20.0,
        ),
          FloatingActionButton(
            heroTag: "redo",
            onPressed: () {
              _controller.redo();
            },
            child: const Text("redo"),
          ),

          const SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
            heroTag: "clear",
            onPressed: () {
              _controller.clear();
            },
            child: const Text("clear"),
          ),

          const SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
            heroTag: "back",
            onPressed: () {
              _controller.convertToImage();
            },
            child: const Text("back"),
          ),

          const SizedBox(
            height: 20.0,
          ),

        ])
    );



}}


