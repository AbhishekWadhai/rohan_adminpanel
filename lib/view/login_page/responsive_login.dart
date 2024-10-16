import 'package:flutter/material.dart';

class ResponsiveLogin extends StatelessWidget {
  final Widget mobileBody;

  final Widget desktopBody;

  ResponsiveLogin({
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileBody;
        } else if (constraints.maxWidth < 1100) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
