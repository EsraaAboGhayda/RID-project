import 'package:flutter/material.dart';
import 'package:ride_project/core/widgets/app_Drawer.dart';
import 'package:ride_project/responsive/view/singup_page.dart';

import '../../features/feature_onbording/onbording.dart';
import '../../features/feature_authentication/view/signup.dart';

class tabletScaffold extends StatefulWidget {
  const tabletScaffold({super.key});

  @override
  State<tabletScaffold> createState() => _tabletScaffoldState();
}

class _tabletScaffoldState extends State<tabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: myDrawer,
        body: Center(
          child: Expanded(
            // child: Container(
            //   height: MediaQuery.of(context).size.height * 0.7,
            //   width: MediaQuery.of(context).size.width * 0.7,
            //   decoration: BoxDecoration(
            //       // color: Colors.green,
            // borderRadius: BorderRadius.circular(15)),
            child: SignUpPage(),
            // ),
          ),
        ));
  }
}
