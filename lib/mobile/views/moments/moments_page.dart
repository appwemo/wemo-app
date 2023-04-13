import 'package:etiocart/constants/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MomentsPage extends StatelessWidget {
  const MomentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
          actions: [
            IconButton(
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.memories,
                  // color: StylingData.bgColor,
                )),
            Spacer(),
            IconButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.red),
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () => {},
                icon: Icon(
                  CupertinoIcons.plus,
                  // color: StylingData.bgColor,
                )),
          ],
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => moments(context),
        ));
  }

  moments(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                'Moment',
                style: StylingData.titleText3,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Post title',
                style: StylingData.subText,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: height * 0.25,
            color: Colors.grey[200],
          )
        ],
      ),
    );
  }
}
