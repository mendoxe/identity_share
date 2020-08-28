import 'package:flutter/material.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/utils/router.dart';

class ContactPickDialog extends StatefulWidget {
  const ContactPickDialog({Key key}) : super(key: key);

  @override
  _ContactPickDialogState createState() => _ContactPickDialogState();
}

class _ContactPickDialogState extends State<ContactPickDialog> {
  String dropDownValue = "facebook";

  List<DropdownMenuItem<String>> dropDownItems = [
    DropdownMenuItem(
      child: Text(Resources.facebook),
      value: "facebook",
    ),
    DropdownMenuItem(
      child: Text(Resources.email),
      value: "email",
    ),
    DropdownMenuItem(
      child: Text(Resources.phone),
      value: "phone",
    ),
    DropdownMenuItem(
      child: Text(Resources.instagram),
      value: "instagram",
    ),
    DropdownMenuItem(
      child: Text(Resources.snapchat),
      value: "snapchat",
    ),
    DropdownMenuItem(
      child: Text(Resources.twitter),
      value: "twitter",
    ),
    // DropdownMenuItem(
    //   child: Text(Resources.other),
    //   value: "other",
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: DropdownButton(
          items: dropDownItems,
          value: dropDownValue,
          onChanged: (String s) => onChange(s),
        ),
      ),
      actions: [
        RaisedButton.icon(
          color: Colors.deepPurple,
          label: Text(
            Resources.submit,
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.check,
          ),
          onPressed: () => select(),
        ),
      ],
    );
  }

  void select() {
    Router.sailor.pop(dropDownValue);
  }

  void onChange(String s) {
    setState(() {
      dropDownValue = s;
    });
  }
}
