import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/events/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookEvent extends StatefulWidget {
  BookEvent({Key? key}) : super(key: key);

  @override
  State<BookEvent> createState() => _BookEventState();
}

class _BookEventState extends State<BookEvent> {
  bool confirmed = true;

  int price = 10;

  int counter = 10;

  int seats = 1;

  generalAddcounter() {
    price = counter + price;
    seats = seats + 1;
  }

  generalSubCounter() {
    while (true) {
      if (price != 10) {
        price = price - 10;
      } else {
        return price;
      }
      break;
    }
    seats = seats - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylingData.bgColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(CupertinoIcons.back)),
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Choose Number of Seats', style: StylingData.titleText2,),
              ],
            ),
            economyClass(), vipClass(), vvipClass(), specialClass(),
            Spacer(),
            bookEventButton(context)],
        ),
      ),
    );
  }

  economyClass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Economy',style: StylingData.subText2,), plusMinusCounter()],
    );
  }

  vipClass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ Text('VIP',style: StylingData.subText2,), plusMinusCounter()],
    );
  }

  vvipClass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ Text('VVIP',style: StylingData.subText2,), plusMinusCounter()],
    );
  }

  specialClass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ Text('Special Class',style: StylingData.subText2,), plusMinusCounter()],
    );
  }

  plusMinusCounter() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                generalSubCounter();
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent)),
              child: const Center(
                  child: Text(
                '-',
                style: TextStyle(fontSize: 30, color: Colors.grey),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text('$seats'),
          ),
          InkWell(
            onTap: () {
              setState(() {
                generalAddcounter();
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent)),
              child: const Center(
                  child: Text(
                '+',
                style: TextStyle(fontSize: 30, color: Colors.grey),
              )),
            ),
          )
        ],
      ),
    );
  }

  bookEventButton(context) {
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
            MaterialPageRoute(builder: (context) => const Payment()),
          );

        },
        child: const Text(
          'Continue-100 Birr',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
