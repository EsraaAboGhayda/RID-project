import 'package:flutter/material.dart';
import 'package:ride_project/core/widgets/app_Drawer.dart';
import 'package:ride_project/responsive/view/singup_page.dart';

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
    return Scaffold(
        drawer: myDrawer,
        body: Column(
          children: [
            if (!_islandscape)
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: singup_page(),
                  ),
                ),
              ),
            if (_islandscape)
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        // color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: singup_page(),
                  ),
                ),
              ),
          ],
        ));
  }
}
