import 'package:flutter/material.dart';
import 'package:pocket_health/login_screen.dart';
import 'package:pocket_health/animated_image.dart';

class FirstScreen extends StatelessWidget {
  // var MQ;
  // final double usableHeight;
  // final double usableWidth;
  final MQ;
  final double usableHeight;
  final double usableWidth;
  FirstScreen(
      {required this.MQ,
      required this.usableHeight,
      required this.usableWidth});

  void LoginScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      LoginPage.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: usableHeight * 0.033, bottom: usableHeight * 0.057),
            child: FittedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: usableWidth * 0.075,
                  ),
                  Container(
                    child: Image.asset('assets/img/titleImg.png'),
                    height: 90,
                    width: usableWidth * 0.173,
                  ),
                  SizedBox(
                    width: usableWidth * 0.042,
                  ),
                  Container(
                    child: Image.asset('assets/img/title.png',
                        fit: BoxFit.scaleDown),
                    height: 60,
                    width: usableWidth * 0.60,
                  ),
                  SizedBox(
                    width: usableWidth * 0.11,
                  )
                ],
              ),
            ),
          ),
          FittedBox(
            child:
                Image.asset("assets/img/welcomeMsg.png", fit: BoxFit.scaleDown),
          ),
          SizedBox(
            height: usableHeight * 0.035,
          ),
          FittedBox(
            child: Image.asset("assets/img/welcomeSubMsg.png",
                fit: BoxFit.scaleDown),
          ),
          SizedBox(
            height: usableHeight * 0.039,
          ),
          // Container(
          //     padding: EdgeInsets.all(0),
          //     height: 250,
          //     child: Image.asset("assets/img/yogaWoman.png",
          //         fit: BoxFit.scaleDown)),
          AnimatedImage(),
          SizedBox(
            height: usableHeight * 0.049,
          ),
          FlatButton(
              child: Image.asset('assets/img/buttonText.png',
                  fit: BoxFit.scaleDown),
              onPressed: () => LoginScreen(context),
              color: Color.fromRGBO(248, 96, 96, 1),
              height: usableHeight * 0.070,
              minWidth: usableWidth * 0.90,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              )),
        ],
      ),
    );
  }
}
