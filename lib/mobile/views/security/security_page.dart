import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class SecurityPage extends StatefulWidget {
  SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool light1 = true;

  bool light2 = true;

  bool light3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
        ),
        body: ListView(
          children: [
            securityPageTitle(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: securityPageBody(),
            )
          ],
        ));
  }

  securityPageTitle() {
    return Column(
      children: [
        Column(
          children: [
            const Text(
              'Security',
              style: StylingData.titleText,
            ),
            Text(
              'Security',
              style: StylingData.subText3,
            ),
          ],
        )
      ],
    );
  }

  securityPageBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              const Text('Use Your Face Scan to Secure Your Account',
                  style: StylingData.subText2),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text(
                'Use Face Scan',
                style: StylingData.titleText3,
              ),
              const Spacer(),
              Switch(
                activeColor: StylingData.purple1,
                value: light1,
                onChanged: (bool value) {
                  setState(() {
                    light1 = value;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Text(
                'Use FingerPrints to Secure Your Account',
                style: StylingData.subText2,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Text(
                'Use Finger Scan',
                style: StylingData.titleText3,
              ),
              const Spacer(),
              Switch(
                activeColor: StylingData.grey1,
                value: light2,
                onChanged: (bool value) {
                  setState(() {
                    light2 = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
