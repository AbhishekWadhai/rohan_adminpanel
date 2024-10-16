import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.white;
var appBarColor = Colors.white70;
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Row(
    children: [
      SizedBox( height: 40, width: 40, child: Image.asset("assets/rohan_logo.png")),
      const SizedBox(width: 50,),
      const Text(
        'ROHAN ATMARAKSHA',
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 10),
      ),
    ],
  ),
  centerTitle: false,
);
var drawerTextColor = const TextStyle(
  color: Colors.white,
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Colors.blue[300],
  elevation: 0,
  child: Column(
    children: [
      const DrawerHeader(
        child: Icon(
          Icons.person,
          size: 64,
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.home),
          title: Text(
            'D A S H B O A R D',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'S E T T I N G S',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.info),
          title: Text(
            'A B O U T',
            style: drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            'L O G O U T',
            style: drawerTextColor,
          ),
        ),
      ),
    ],
  ),
);
