import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/utils/router.dart';
import 'package:identity_share/widgets/form_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController snapchatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new card"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MFormField(
                validator: (value) {
                  if (value.isEmpty) return 'Please enter some text';
                  return null;
                },
                optional: false,
                controller: nameController,
                icon: Icon(Icons.person),
                hintText: "Name",
              ),
              MFormField(
                icon: Icon(Icons.email),
                hintText: "Email",
                controller: emailController,
              ),
              MFormField(
                icon: Icon(Icons.phone),
                hintText: "Phone",
                controller: phoneController,
              ),
              MFormField(
                icon: Icon(MdiIcons.instagram),
                hintText: "Instagram",
                controller: instagramController,
              ),
              MFormField(
                icon: Icon(MdiIcons.twitter),
                hintText: "Twitter",
                controller: twitterController,
              ),
              MFormField(
                icon: Icon(MdiIcons.snapchat),
                hintText: "Snapchat",
                controller: snapchatController,
              ),
              MFormField(
                icon: Icon(MdiIcons.facebook),
                hintText: "Facebook",
                controller: facebookController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _submitted(),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitted() {
    if (_formKey.currentState.validate()) {
      List<Contact> contacts = [];
      if (emailController.value.text != null &&
          emailController.value.text != "") {
        contacts.add(Contact("email", emailController.value.text));
      }
      if (phoneController.value.text != null &&
          phoneController.value.text != "") {
        contacts.add(Contact("phone", phoneController.value.text));
      }
      if (facebookController.value.text != null &&
          facebookController.value.text != "") {
        contacts.add(Contact("facebook", facebookController.value.text));
      }
      if (instagramController.value.text != null &&
          instagramController.value.text != "") {
        contacts.add(Contact("instagram", instagramController.value.text));
      }
      if (twitterController.value.text != null &&
          twitterController.value.text != "") {
        contacts.add(Contact("twitter", twitterController.value.text));
      }
      if (snapchatController.value.text != null &&
          snapchatController.value.text != "") {
        contacts.add(Contact("snapchat", snapchatController.value.text));
      }
      print(contacts);
      Hive.box("cards").add(ContactCard(contacts, nameController.value.text));
      if (Hive.box("favorite").isEmpty) {
        Hive.box("favorite").add(Hive.box("cards").getAt(0));
      }
      Router.sailor.pop();
    }
  }
}
