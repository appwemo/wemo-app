import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: Center(child: Text('Security'),),
    );
  }
}
