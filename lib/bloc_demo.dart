import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_test/generic_bloc_provider.dart';

class BlocDemoPage extends StatelessWidget {
  static const routeName = "BlocDemoPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLoC Architecture Demo",
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: BlocProvider(
            bloc: ColorBloc(),
            child: Column(
              children: <Widget>[
                Child1(),
                Child2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorBloc extends BlocBase {
// streams of Color
  StreamController streamListController = StreamController<Color>.broadcast();

// sink
  Sink get colorSink => streamListController.sink;

// stream
  Stream<Color> get colorStream => streamListController.stream;

// function to change the color
  changeColor() {
    colorSink.add(getRandomColor());
  }

//disponsing our Stream
  @override
  dispose() {
    streamListController.close();
  }
}

class Child1 extends StatelessWidget {
  ColorBloc colorBloc;

  @override
  Widget build(BuildContext context) {
    //geeting the instance of our model created at Parent
    colorBloc = BlocProvider.of(context);
    return Column(
      children: <Widget>[
        Container(
          child: StreamBuilder(
            initialData: Colors.red,
            stream: colorBloc.colorStream,
            builder: (context, snapShot) => Center(
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    color: snapShot.data,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

class Child2 extends StatelessWidget {
  ColorBloc colorBloc;

  @override
  Widget build(BuildContext context) {
    colorBloc = BlocProvider.of(context);
    return Column(
      children: <Widget>[
        Container(
          child: Center(
            child: RaisedButton(
              child: Text("Change Color"),
              color: Colors.blue,
              onPressed: () {
                colorBloc.changeColor();
              },
            ),
          ),
        ),
      ],
    );
  }
}

// Random Colour generator
Color getRandomColor() {
  Random _random = Random();
  return Color.fromARGB(
    255,
    _random.nextInt(256),
    _random.nextInt(256),
    _random.nextInt(256),
  );
}
