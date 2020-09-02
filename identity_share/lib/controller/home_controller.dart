import 'dart:convert';
import 'dart:developer';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/provider/home_provider.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/utils/router.dart';
import 'package:identity_share/widgets/help_dialog.dart';
import 'package:provider/provider.dart';

class HomeController {
  void scan(BuildContext context) async {
    var result = await BarcodeScanner.scan();
    var json;
    try {
      json = jsonDecode(result.rawContent);
    } catch (e) {
      log(e.toString());
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(Resources.smthngWentWrong)));
      return;
    }
    ContactCard card = ContactCard.fromJson(json);
    card.tag = null;
    Hive.box("contacts").add(card);
    context.read<HomeProvider>().selectCard(card);
    context.read<HomeProvider>().setMyCard(false);
    context.read<HomeProvider>().isPreview(true);
    Router.sailor("/contactDetail");
  }

  void help(BuildContext context) {
    showDialog(
      context: context,
      child: HelpDialog(),
    );
  }
}
