import 'package:etiocart/mobile/views/events/failed_success_pop.dart';
import 'package:etiocart/mobile/views/events/ticket_receipt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class ReviewSummary extends StatelessWidget {
  const ReviewSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Summary'),
        elevation: 0,
      ),
      body: Column(
        children: [
          festivalInfo(context),
          userInfo(),
          totalInfo(),
          paymentTypesBody(context),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: continuetoPaymentButton(context),
          )
        ],
      ),
    );
  }

  festivalInfo(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: height * 0.13,
            width: width * 0.3,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('National Music Festival',
                    style: StylingData.titleText2),
                const Text(
                  '18:00 - 23:00 PM (GMT+7:00)',
                  style: StylingData.subText3,
                ),
                const Text('Grand Park Newyork'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  userInfo() {
    return Card(
      color: StylingData.bgColor,
      elevation: 0,
      surfaceTintColor: StylingData.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Full Name',
                    style: StylingData.subText2,
                  ),
                  Spacer(),
                  Text('Andrew Ansley', style: StylingData.subText)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text('Phone', style: StylingData.subText2),
                  Spacer(),
                  Text('+111 123 543 0921', style: StylingData.subText)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text('Email', style: StylingData.subText2),
                  Spacer(),
                  Text('andrewansley@gmail.com', style: StylingData.subText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  totalInfo() {
    return Card(
      color: StylingData.bgColor,
      elevation: 0,
      surfaceTintColor: StylingData.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Seats',
                    style: StylingData.subText2,
                  ),
                  Spacer(),
                  Text('50 Birr', style: StylingData.subText)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text('Tax', style: StylingData.subText2),
                  Spacer(),
                  Text('2.5 Birr', style: StylingData.subText)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text('Total', style: StylingData.subText2),
                  Spacer(),
                  Text('52.5 Birr', style: StylingData.subText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  paymentTypesBody(context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
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

  continuetoPaymentButton(context) {
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
            MaterialPageRoute(builder: (context) => successPop(context)),
          );
        },
        child: const Text(
          'Finish Payment',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  successPop(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
        elevation: 5,
        title: Center(child: const Text('Confirmation')),
        backgroundColor: StylingData.bgColor,
        content: SingleChildScrollView(
            child: ListBody(
          children: [
            // Card(child: Image.asset('asset/images/shield.jpg')),
            Padding(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Congratulation',
                style: StylingData.titleText,
              ),
            ),
            const Text('You Have Successfully made an order'),
            const Text('for National Music Festival, enjoy the event'),
            tryAgainButton(context),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: cancelButton(context),
            )
          ],
        )));
  }

  tryAgainButton(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.06,
      width: width * 0.7,
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
            MaterialPageRoute(builder: (context) => TicketReceipt()),
          );
        },
        child: const Text(
          'Try Again',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  cancelButton(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: height * 0.06,
      width: width * 0.7,
      child: ElevatedButton(
        style: ButtonStyle(
            //sets the button elevation to zero
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                StylingData.purple1.withOpacity(0.05)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              side: const BorderSide(color: StylingData.purple3),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => ConfirmationPop()),
          );
        },
        child: const Text(
          'Cancel',
          style: StylingData.buttonText2,
        ),
      ),
    );
  }
}
