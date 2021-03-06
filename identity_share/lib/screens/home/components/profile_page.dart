import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/widgets/contact_card_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("cards").listenable(),
      builder: (context, value, child) => Hive.box("cards").length > 0
          ? ListView.builder(
              itemCount: Hive.box("cards").length,
              itemBuilder: (context, index) => ContactCardWidget(
                card: Hive.box("cards").getAt(index),
                myCard: true,
                index: index,
              ),
            )
          : Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: Text(
                  Resources.createCardBy,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
    );
  }
}
