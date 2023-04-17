import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> with TickerProviderStateMixin {
  late AnimationController _coontroller;
  late Animation<double> _animation;
  void initState() {
    super.initState();
    _coontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = CurvedAnimation(parent: _coontroller, curve: Curves.easeIn);

    _coontroller.forward();
  }

  @override
  void dispose() {
    // _animation.isCompleted;
    // _coontroller.isCompleted;
    _coontroller.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/2nadine.jpg'), context);
    // var
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              // color: Colors.teal,
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "asset/images/4664c5.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 500,
            // bottom: 40,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.vertical,
                    child: Column(
                      children: const [
                        Text(
                          textAlign: TextAlign.center,
                          "Grab All events now only in your Hands!",
                          style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'consoali',
                            leadingDistribution: TextLeadingDistribution.even,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'ijfei dfsf e fsefsdfe sfsedf efsdf esdfesfd esfdsf wesdfwesd fesdffwes dfesdf ewsdf wewe',
                          style: TextStyle(
                              color: Colors.brown,
                              fontFamily: 'consoali',
                              leadingDistribution: TextLeadingDistribution.even,
                              fontWeight: FontWeight.bold
                              // fontSize: 20,
                              // fontWeight: FontWeight.bold,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Center(
                //   child:
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 80,
                    right: 80,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
