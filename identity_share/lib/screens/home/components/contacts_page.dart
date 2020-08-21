import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/widgets/contact_card_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: Hive.box("contacts").listenable(),
        builder: (context, value, child) => Hive.box("contacts").length > 0
            ? ListView.builder(
                itemCount: Hive.box("contacts").length,
                itemBuilder: (context, index) => ContactCardWidget(
                  card: Hive.box("contacts").getAt(index),
                  myCard: false,
                  index: index,
                ),
              )
            : Center(
                child: Text(
                  "No contacts stored",
                  style: TextStyle(fontSize: 16),
                ),
              ),
      ),
    );
  }
}
