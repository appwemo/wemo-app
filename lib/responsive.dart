import 'package:etiocart/mobile/view/authentication/mobile_sign_in.dart';
import 'package:flutter/material.dart';

import 'mobile/view/authentication/mobile_sign_up.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout(
      {super.key,
      required this.desktopScaffold,
      required this.mobileScaffold,
      required this.tabletScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileSignUp();
        } else if (constraints.maxWidth < 800) {
          return const MobileSignUp();
        } else {
          return const MobileSignIn();
        }
      },
    );
  }
}
