import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/help_center/contact_us.dart';
import 'package:etiocart/mobile/views/faq/faq.dart';
import 'package:etiocart/mobile/views/help_center/policies.dart';
import 'package:etiocart/mobile/views/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return helpCenterTab(context);
  }

  Widget helpCenterTab(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 20.0,
              color: Colors.teal.shade800,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // automaticallyImplyLeading: false,
            title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                child: const Text(
                  'Help center',
                  style: StylingData.appBarText,
                )),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: TabBar(
              unselectedLabelColor: Colors.grey.shade400,
              labelColor: Colors.teal.shade800,
              tabs: const [
                Tab(
                    child: Text(
                  'FAQ',
                  style: StylingData.titleText3,
                )),
                Tab(
                    child: Text(
                  'Contact Us',
                  style: StylingData.titleText3,
                )),
                Tab(
                    child: Text(
                  'Policies',
                  style: StylingData.titleText3,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FAQ(),
              ContactUS(),
              Policies()
            ],
          ),
        ),
      ),
    );
  }


}
