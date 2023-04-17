import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/review_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/export_model.dart';
import '../../model/user/getuser_model.dart';

class Payment extends StatelessWidget {
  final Events data;
  final getuser? user;
  const Payment({Key? key, required this.data, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(CupertinoIcons.back)),
        elevation: 0,
        title: Text(
          'Payments',
          style: StylingData.appBarText,
        ),
      ),
      // backgroundColor: StylingData.bgColor,
      body: Column(
        children: [
          paymentTypesBody(context),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: continuetoPaymentButtom(context),
          )
        ],
      ),
    );
  }

  //you map this to the list builder and the
  // payment method available in the API
  paymentTypesBody(context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          'Select the Payment Want to use.',
          style: StylingData.titleText2,
        ),
        Container(
          height: height * 0.1,
          child: Card(
            color: StylingData.bgColor,
            surfaceTintColor: StylingData.bgColor,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CBE Birr',
                    style: StylingData.titleText2,
                  ),
                  Text('use', style: StylingData.titleText2)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  continuetoPaymentButtom(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.06,
      width: width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
            //sets the button elevation to zero
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(StylingData.purple1),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReviewSummary(
                      data: data,
                      user: user,
                    )),
          );
        },
        child: const Text(
          'Review',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
