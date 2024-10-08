import 'package:flutter/material.dart';
import 'package:ride_project/core/widgets/app_Drawer.dart';
import 'package:ride_project/features/feature_onbording/onbording.dart';

import '../../features/feature_authentication/view/signup.dart';

class mobileScaffold extends StatefulWidget {
  const mobileScaffold({super.key});

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  @override
  Widget build(BuildContext context) {
    final _islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(drawer: myDrawer, body: SignUpPage());
  }
}
