import 'package:etiocart/constants/theme_data.dart';
import 'package:flutter/material.dart';
class ConfirmationPop extends StatelessWidget {
  const ConfirmationPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StylingData.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 200, bottom: 200),
        child: Center(child: successPop(context)),
      ),
    );
  }

  successPop(context){
    return AlertDialog(
      title: Center(child: const Text('Confirmation')),
      backgroundColor: StylingData.grey3,
      content: Column(
        children: [
          // Card(child: Image.asset('asset/images/shield.jpg')),
          Padding(
            padding: const EdgeInsets.all(10),
            child: const Text('Congratulation',style: StylingData.titleText,),
          ),
          const Text('You Have Successfully made an order'),
          const Text('for National Music Festival, enjoy the event'),
          Spacer(),
          tryAgainButton(context),
          Padding(padding: EdgeInsets.only(top: 10),child: cancelButton(context),)

        ],
      )
    );
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
            MaterialPageRoute(builder: (context) => ConfirmationPop()),
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
            backgroundColor: MaterialStateProperty.all(StylingData.purple1.withOpacity(0.05)),
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
