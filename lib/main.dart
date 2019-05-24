import 'package:flutter/material.dart';
import 'package:widget_test/bloc_demo.dart';
import 'package:widget_test/hero_animation_page.dart';
import 'package:widget_test/stagger_animation_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        HeroAnimationPage.routeName: (context) => HeroAnimationPage(),
        StaggerAnimationPage.routeName: (context) => StaggerAnimationPage(),
        BlocDemoPage.routeName: (context) => BlocDemoPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              child: Text("HeroAnimationPage"),
              onPressed: () {
                Navigator.of(context).pushNamed(HeroAnimationPage.routeName);
              },
            ),
            OutlineButton(
              child: Text("StaggerAnimationPage"),
              onPressed: () {
                Navigator.of(context).pushNamed(StaggerAnimationPage.routeName);
              },
            ),
            OutlineButton(
              child: Text("BlocDemoPage"),
              onPressed: () {
                Navigator.of(context).pushNamed(BlocDemoPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
