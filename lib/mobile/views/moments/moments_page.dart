import 'package:etiocart/constants/theme_data.dart';
import 'package:flutter/material.dart';

class MomentsPage extends StatelessWidget {
  const MomentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: Center(child: Text('Profile'),),    );
  }
}
