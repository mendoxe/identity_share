import 'package:flutter/material.dart';
import 'package:identity_share/model/contact.dart';

class ContactHolder extends StatelessWidget {
  const ContactHolder({Key key, @required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: contact.getIcon(),
      title: Text(contact.value),
      subtitle: Text(contact.type),
    );
  }
}
