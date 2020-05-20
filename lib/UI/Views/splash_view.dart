import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/chat_bg.png"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Image(
              image: AssetImage("assets/images/logo.png"),
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
