import 'package:flutter/material.dart';
import 'package:ride_project/core/widgets/app_Drawer.dart';

import '../../featureOne/onbording.dart';
import '../../featureTow/view/signup.dart';

class desktopScaffold extends StatefulWidget {
  const desktopScaffold({super.key});

  @override
  State<desktopScaffold> createState() => _desktopScaffoldState();
}

class _desktopScaffoldState extends State<desktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer,
        body: Center(
          child: Expanded(
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.7,
            //     width: MediaQuery.of(context).size.width * 0.7,
            //     decoration: BoxDecoration(
            //         // color: Colors.green,
            //         borderRadius: BorderRadius.circular(15)),
            child: SignUpPage(),
            // ),
          ),
        ));
  }
}
