import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 路由A
class HeroAnimationPage extends StatelessWidget {
  static const routeName = "HeroAnimationPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset(
                "assets/images/avatar.png",
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            //打开B路由
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("原图"),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Hero(
          tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset("assets/images/avatar.png"),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
