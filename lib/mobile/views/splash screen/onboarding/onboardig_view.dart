import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../authentication/mobile_sign_in.dart';
import 'onboarding_export.dart';

class OnBoardingSCreen extends StatefulWidget {
  const OnBoardingSCreen({super.key});

  @override
  State<OnBoardingSCreen> createState() => _OnBoardingSCreenState();
}

class _OnBoardingSCreenState extends State<OnBoardingSCreen>
    with TickerProviderStateMixin {
  late AnimationController _coontroller;
  late Animation<double> _animation;
  void initState() {
    super.initState();
    _coontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation =
        CurvedAnimation(parent: _coontroller, curve: Curves.linearToEaseOut);

    _coontroller.forward();
  }

  PageController _controller = PageController();

  bool OnLastPage = false;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: 0,
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                OnLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
        ),
        Positioned(
          top: 70,
          left: 20,
          child: SmoothPageIndicator(
            effect: ScrollingDotsEffect(
                activeStrokeWidth: 3,
                activeDotScale: 1.8,
                // fixedCenter: true,
                dotColor: Colors.teal.shade100,
                // strokeWidth: 4,
                spacing: 10,
                offset: 4,
                activeDotColor: Colors.brown,
                dotHeight: 4,
                dotWidth: 15),
            controller: _controller,
            count: 3,
            onDotClicked: (index) {},
          ),
        ),
        Positioned(
          top: h * 0.85,
          left: 50,
          child: Container(
            // alignment: Alignment(0, 15),
            child: Column(
              children: [
                // SmoothPageIndicator(
                //   effect: ExpandingDotsEffect(dotHeight: 10, dotWidth: 10),
                //   controller: _controller,
                //   count: 3,
                //   onDotClicked: (index) {},
                // ),
                SizedBox(
                  height: 25,
                ),
                OnLastPage
                    ? GestureDetector(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 50),
                              backgroundColor: Color(0xFF0B594C),
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  // topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        MobileSignIn(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Phtwo2()));
                            },
                            child: Text("GetStarted")),
                      )
                    : GestureDetector(
                        child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(300, 50),
                              foregroundColor: Color(0xFF0B594C),
                              backgroundColor: Colors.white,
                              elevation: 5, //<-- SEE HERE
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              shadowColor: Color(0xFF0B594C), //<-- SEE HERE
                            ),
                            onPressed: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.decelerate);
                            },
                            child: Text("Next")),
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
