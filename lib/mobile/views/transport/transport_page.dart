import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: Center(child: Text('Profile'),),
    );
  }
}
