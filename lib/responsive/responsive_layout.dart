import 'package:flutter/material.dart';

// ignore: camel_case_types
class responsive_loyout extends StatelessWidget {
  final Widget mobilescaffold;
  final Widget tabletscaffold;
  final Widget desktposcaffold;

  const responsive_loyout(
      {super.key,
      required this.mobilescaffold,
      required this.tabletscaffold,
      required this.desktposcaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth < 400) {
        return mobilescaffold;
      } else if (Constraints.maxWidth < 1100) {
        return tabletscaffold;
      } else {
        return desktposcaffold;
      }
    });
  }
}
