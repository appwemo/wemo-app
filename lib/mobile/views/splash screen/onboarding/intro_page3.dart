import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    precacheImage(AssetImage('assets/dvn1.jpg'), context);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.7,
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100)),
                  image: DecorationImage(
                      image: AssetImage(
                        'asset/images/cheerful.jpg',
                      ),
                      fit: BoxFit.cover)),
            ),
            // Center(
            //   child: Container(
            //     color: Colors.green,
            //     height: 500,
            //     width: 350,
            //     child: Image.asset("assets/union.png"),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 80,
                right: 80,
              ),
              child: Text(
                textAlign: TextAlign.center,
                "Let\s go to your Favorite event right now",
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
    );
  }
}
