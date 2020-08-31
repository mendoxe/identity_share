import 'dart:convert';
import 'dart:developer';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/controller/home_controller.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/provider/home_provider.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/utils/router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'components/contacts_page.dart';
import 'components/profile_page.dart';
import 'components/scan_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<String> titles = [Resources.scan, Resources.contacts, Resources.profile];
  List<DropdownMenuItem> dropDownItems = [
    const DropdownMenuItem(
      value: "EN",
      child: const Text("EN"),
    ),
    const DropdownMenuItem(
      value: "CZ",
      child: const Text("CZ"),
    ),
  ];
  String dropdownValue = "EN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
        actions: _getActions(context),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => _changePage(newIndex),
        items: [
          BottomNavigationBarItem(
            title: Text(Resources.scan),
            icon: Icon(MdiIcons.qrcode),
          ),
          BottomNavigationBarItem(
            title: Text(Resources.contacts),
            icon: Icon(Icons.contacts),
          ),
          BottomNavigationBarItem(
            title: Text(Resources.profile),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: _floatingBtn(),
    );
  }

  List<Widget> _getActions(BuildContext context) {
    switch (index) {
      case 0:
        return [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () => HomeController().help(context),
          ),
        ];

      case 1:
        return [];

      case 2:
        return [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              iconEnabledColor: Colors.white,
              dropdownColor: Colors.deepPurple,
              items: dropDownItems,
              value: dropdownValue,
              onChanged: (value) {
                Resources().init(getLang(value));
                setState(() {
                  dropdownValue = value;
                });
              },
            ),
          ),
        ];

      default:
        return [];
    }
  }

  Widget _floatingBtn() {
    switch (index) {
      case 0:
        return Builder(
          builder: (ctx) => FloatingActionButton(
            child: Icon(
              Icons.photo_camera,
              size: 30,
            ),
            onPressed: () => HomeController().scan(ctx),
          ),
        );

      case 1:
        return const SizedBox.shrink();

      case 2:
        return Builder(
          builder: (ctx) => FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => Router.sailor("/add"),
          ),
        );
    }

    return const SizedBox.shrink();
  }

  Widget _body() {
    switch (index) {
      case 0:
        return ScanPage();

      case 1:
        return ContactsPage();

      case 2:
        return ProfilePage();

      default:
        return const SizedBox.shrink();
    }
  }

  void _changePage(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
