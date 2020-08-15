import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:identity_share/screens/components/contacts_page.dart';
import 'package:identity_share/screens/components/profile_page.dart';
import 'package:identity_share/screens/components/scan_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera,
          size: 30,
        ),
        onPressed: () => _scan(),
      ),
    );
  }

  void _scan() async {
    var result = await BarcodeScanner.scan();
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
