import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapPage(),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(33.510414, 36.278336),
              initialZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                  ),
                ],
              ),
              MarkerLayer(markers: [
                Marker(
                  point: LatLng(33.510414, 36.278336),
                  child: FlutterLogo(),
                )
              ])
            ],
          ),
          Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Enable your location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "choose your location to start find the \n             request arounded you",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: PublicButton(
                      text: "Use my location",
                      color: ColorsManager.txt_buttonColor_secondary,
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      width: 340.0,
                      height: 54.0,
                      borderRadius: 8.0,
                      side: BorderSide(
                        color: ColorsManager.border_buttonColor_secondary,
                        width: 1.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                      onTap: () {},
                      child: Center(
                          child: Text("Skip for now",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15))))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
