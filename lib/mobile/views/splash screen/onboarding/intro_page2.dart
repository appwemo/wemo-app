import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> with TickerProviderStateMixin {
  late AnimationController _animeController;
  @override
  void initState() {
    super.initState();
    _animeController = AnimationController(vsync: this);
    _animeController.addListener(() {
      if (_animeController.value > 0.7) {
        // _animeController.stop();
        // copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          // isTextReady = true;
          setState(() {
            // isTextReady = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _animeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/2nadine.jpg'), context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 100,
            child: Center(
              // color: Colors.amber,
              child: Lottie.asset(
                height: 450,
                width: 450,
                'asset/images/139032-relax.json',
                // controller: _animeController,
                // onLoaded: (p0) {
                //   _animeController
                //     ..duration = p0.duration
                //     ..forward();
                // },
              ),
            ),
          ),
          Positioned(
            left: 0,

            right: 0,
            top: 480,
            // bottom: 0,
            child: Container(
              // alignment: Alignment.bottomCenter,
              // color: Colors.red,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 80,
                      right: 80,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Easy payment & Fast event Ticketing",
                      style: TextStyle(
                        fontFamily: 'consoali',
                        leadingDistribution: TextLeadingDistribution.even,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 15,
                      right: 15,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      'ijfei dfsf e fsefsdfe sfsedf efsdf esdfesfd esfdsf wesdfwesd fesdffwes dfesdf ewsdf wewe',
                      style: TextStyle(
                        fontFamily: 'consoali',
                        leadingDistribution: TextLeadingDistribution.even,
                        // fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
