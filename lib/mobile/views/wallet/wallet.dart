import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: StylingData.bgColor,
        appBar: AppBar(
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Text(
                  'Andrew Ansley',
                  style: StylingData.titleText,
                ),
                Text(
                  'andrewansley@gmail.com',
                  style: StylingData.titleText3,
                ),
              ],
            ),
            walletBody(context),
            walletBody(context),
            Padding(
              padding: EdgeInsets.all(10),
              child: changeAccountButton(context),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Transactions',style: StylingData.titleText2,),
                  Text('View Your Transaction History',style: StylingData.titleText3,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: viewTransactionHistory(context),
            )
          ],
        ));
  }

  walletBody(context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            elevation: 5,
            color: StylingData.bgColor,
            surfaceTintColor: StylingData.bgColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Bank', style: StylingData.titleText3),
                      Spacer(),
                      Text(
                        'Awash',
                        style: StylingData.subText,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Account Number', style: StylingData.titleText3),
                      Spacer(),
                      Text('1000001231234', style: StylingData.subText),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Primary', style: StylingData.titleText3),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Balance', style: StylingData.titleText3),
                      Spacer(),
                      Text('1200 Birr', style: StylingData.subText),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeAccountButton(context) {
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
              side: BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {},
        child: const Text(
          'change account',
          style: StylingData.buttonText,
        ),
      ),
    );
  }

  viewTransactionHistory(context) {
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
              side: BorderSide(color: StylingData.purple1),
              borderRadius: BorderRadius.circular(25),
            ))),
        onPressed: () {},
        child: const Text(
          'Transactions History',
          style: StylingData.buttonText,
        ),
      ),
    );
  }
}
