import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];
var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
);
var myDrawer = Drawer(
  backgroundColor: Color.fromARGB(255, 193, 62, 62),
  child: Column(
    children: [
      const DrawerHeader(
          child: Column(
        children: [
          Row(children: [Icon(Icons.arrow_back_ios_sharp), Text("Back")]),
          CircleAvatar(),
          ListTile(leading: Text('Note Samson'), title: Text('note@email.con'))
        ],
      )),
      Expanded(
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.history_edu),
              title: Text('History'),
            ),
            ListTile(
              leading: Icon(Icons.add_comment),
              title: Text('Complain'),
            ),
            ListTile(
              leading: Icon(Icons.group_sharp),
              title: Text('Complain'),
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text('About Us'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help and Support'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
    ],
  ),
);
