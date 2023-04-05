import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';
class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: StylingData.bgColor,
        foregroundColor: StylingData.frColor,
      ),
      body: Center(child: Text('WAllet'),),    );
  }
}
