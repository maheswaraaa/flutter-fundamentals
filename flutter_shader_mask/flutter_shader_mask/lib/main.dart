import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Gradient Opacity"),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                .createShader(
                    Rect.fromLTRB(0, 0, rectangle.width, rectangle.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image(
            width: 300,
            image: NetworkImage(
                "https://www.gstatic.com/devrel-devsite/prod/v1241c04ebcb2127897d6c18221acbd64e7ed5c46e5217fd83dd808e592c47bf6/developers/images/opengraph/blue-grey.png"),
          ),
        ),
      ),
    ));
  }
}
