import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return helpView();
  }

  helpView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        children: const [
          Card(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Text(
                'How to Make Payment',
                style: StylingData.titleText3,
              ),
              children: [
                Text(
                  'How to Make Payment',
                  style: StylingData.titleText3,
                ),
              ],
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Text(
                'What is WeMo?',
                style: StylingData.titleText3,
              ),
              children: [
                Text(
                  'How to Make Payment',
                  style: StylingData.titleText3,
                ),
              ],
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Text(
                'How to Navigate',
                style: StylingData.titleText3,
              ),
              children: [
                Text(
                  'How to Make Payment',
                  style: StylingData.titleText3,
                ),
              ],
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Text(
                'How to Make Payment',
                style: StylingData.titleText3,
              ),
              children: [
                Text(
                  'How to Make Payment',
                  style: StylingData.titleText3,
                ),
              ],
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Text(
                'How to Make Payment',
                style: StylingData.titleText3,
              ),
              children: [
                Text(
                  'How to Make Payment',
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
