import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("favorite").listenable(),
      builder: (context, value, child) => Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          child: Hive.box("favorite").isNotEmpty
              ? QrImage(
                  data: jsonEncode(
                    (Hive.box("favorite").getAt(0) as ContactCard).toJson(),
                  ),
                  version: QrVersions.auto,
                  size: 300.0,
                )
              : Text("Please create a card."),
        ),
      ),
    );
  }
}
