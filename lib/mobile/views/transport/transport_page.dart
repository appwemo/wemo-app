import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.25,
          color: Colors.grey[200],
        ),
        Container(
          height: height * 0.08,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Mon',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.grey))))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Tue',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.grey))))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Wed',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    )))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Thur',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    )))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Fri',
                      style: StylingData.subText3,
                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    )))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Sat',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    )))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () => {},
                    child: Text(
                      'Sun',
                      style: StylingData.subText3,                    ),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    )))),
              ),
            ],
          ),
        ),
        Container(
          height: height*0.495,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => priceInfo(),),
        )
      ],
    ));
  }

  priceInfo() {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: StylingData.grey3,
            child: Container(
              decoration: BoxDecoration(
                color: StylingData.purple1,
                borderRadius: BorderRadius.circular(10)
              ),
            )
          ),
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Addis Abeba - Arba Minch',
                    style: StylingData.mediumText),
                Row(
                  children: [
                    Text('800 Birr',style: StylingData.subText,),
                    Text('500 km',style: StylingData.subText,),
                  ],
                ),
                Text('Selam Bus',style: StylingData.subText3,)
              ],
            ),
          ],
        ),
      ],
    );
  }
}
