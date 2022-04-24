import 'package:flutter/material.dart';
import 'package:pocket_health/home_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/img/titleImage.png',
                fit: BoxFit.scaleDown,
              ),
            ),
            Container(
              height: 525,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Good Morning, Sanket',
                        style: TextStyle(fontFamily: 'Acme', fontSize: 28),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 10,
                        bottom: 20,
                      ),
                      child: Text(
                        'We wish you have a good day',
                        style: TextStyle(
                          fontFamily: 'Acme',
                          fontSize: 20,
                          color: Color.fromRGBO(161, 164, 178, 1),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/img/card1.png',
                                  height: 210,
                                  width: 177,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/img/card2.png',
                                  height: 210,
                                  width: 177,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Image.asset('assets/img/dailyThoughts.png'),
                    ),
                    Container(
                      // width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                'assets/img/bottomCard1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                'assets/img/bottomCard2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                'assets/img/bottomCard1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildProfileView() {
    return HomeBottomBar();
  }
}
