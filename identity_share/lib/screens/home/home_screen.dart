import 'dart:convert';
import 'dart:developer';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/provider/home_provider.dart';
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
  List<String> titles = ["Scan", "Contacts", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
      ),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => _changePage(newIndex),
        items: [
          const BottomNavigationBarItem(
            title: Text("Scan"),
            icon: Icon(MdiIcons.qrcode),
          ),
          const BottomNavigationBarItem(
            title: Text("Contacts"),
            icon: Icon(Icons.contacts),
          ),
          const BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: _floatingBtn(),
    );
  }

  Widget _floatingBtn() {
    switch (index) {
      case 0:
        return Builder(
          builder: (ctx) => FloatingActionButton(
            child: Icon(
              Icons.camera,
              size: 30,
            ),
            onPressed: () => _scan(ctx),
          ),
        );

      case 1:
        return Builder(
          builder: (ctx) => FloatingActionButton(
            child: Icon(
              Icons.camera,
              size: 30,
            ),
            onPressed: () => _scan(ctx),
          ),
        );

      case 2:
        return Builder(
          builder: (ctx) => FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () => _addMyCard(ctx),
          ),
        );
    }

    return const SizedBox.shrink();
  }

  void _addMyCard(BuildContext context) {
    Router.sailor("/add");
  }

  void _scan(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var json;
    try {
      json = jsonDecode(result.rawContent);
    } catch (e) {
      log(e.toString());
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Something went wrong!")));
      return;
    }
    ContactCard card = ContactCard.fromJson(json);
    Hive.box("contacts").add(card);
    context.read<HomeProvider>().selectCard(card);
    context.read<HomeProvider>().setMyCard(false);
    Router.sailor("/contactDetail");
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
