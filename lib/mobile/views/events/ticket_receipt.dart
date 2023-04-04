import 'package:etiocart/constants/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketReceipt extends StatelessWidget {
  const TicketReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: StylingData.bgColor,
        appBar: AppBar(
          backgroundColor: StylingData.bgColor,
          title: Text('Receipt'),
        ),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.all(15),
            child: qrGenerated(),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: eventBody(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: buyerInfo(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: seatsBody(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: paymentTypeBody(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: downloadTicketButton(context),
            ),

          ],
        ));
  }

  qrGenerated() {
    return Center(
        child: QrImage(
      data: "1234567890",
      version: QrVersions.auto,
      size: 200.0,
    ));
  }

  eventBody() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'National Music Festival',
              style: StylingData.titleText2,
            ),
            Text('Awash Bank', style: StylingData.titleText3),
            Text('Event Date', style: StylingData.titleText2),
            Text('Monday December 23', style: StylingData.titleText3),
            Text('Organized By', style: StylingData.titleText2),
            Text('World of Music', style: StylingData.titleText3),
            Text('event Location', style: StylingData.titleText2),
            Text(
              'Grand Park NewYork',
              style: StylingData.titleText3,
            ),
          ],
        ),
      ],
    );
  }

  buyerInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Full Name',
              style: StylingData.titleText3,
            ),
            Spacer(),
            Text('Andrew Ansley', style: StylingData.titleText2)
          ],
        ),
        Row(
          children: const [
            Text('Nick Name', style: StylingData.titleText3),
            Spacer(),
            Text('andrew', style: StylingData.titleText2)
          ],
        ),
        Row(
          children: const [
            Text('Phone', style: StylingData.titleText3),
            Spacer(),
            Text('+1111 234 424 2342', style: StylingData.titleText2)
          ],
        ),
        Row(
          children: const [
            Text('Email', style: StylingData.titleText3),
            Spacer(),
            Text('andrewansley@gmail.com', style: StylingData.titleText2)
          ],
        ),
      ],
    );
  }

  seatsBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Number of Seats',
              style: StylingData.titleText3,
            ),
            Spacer(),
            Text('1', style: TextStyle(fontSize: 20))
          ],
        ),
        Row(
          children: const [
            Text('Price',
                style: TextStyle(color: Colors.black54, fontSize: 18)),
            Spacer(),
            Text('50', style: TextStyle(fontSize: 18))
          ],
        ),
        Row(
          children: const [
            Text('Total',
                style: TextStyle(color: Colors.black54, fontSize: 18)),
            Spacer(),
            Text('55', style: TextStyle(color: Colors.blue, fontSize: 20))
          ],
        ),
      ],
    );
  }

  paymentTypeBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Payment Methods',
              style: StylingData.titleText3,
            ),
            Spacer(),
            Text('CBE Birr', style: StylingData.titleText2)
          ],
        ),
        Row(
          children: const [
            Text('Order ID', style: StylingData.titleText3),
            Spacer(),
            Text('5457382949', style: StylingData.titleText2)
          ],
        ),
        Row(
          children: const [
            Text('Status', style: StylingData.titleText3),
            Spacer(),
            Text('Paid', style: StylingData.titleText2)
          ],
        ),
      ],
    );
  }

  downloadTicketButton(context) {
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
        onPressed: () {},
        child: const Text(
          'Download Ticket',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
