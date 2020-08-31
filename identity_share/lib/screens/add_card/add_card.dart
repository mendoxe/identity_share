import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/utils/resources.dart';
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
  final TextEditingController tagController = TextEditingController();
  final TextEditingController wechatController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController tiktokController = TextEditingController();
  final TextEditingController webController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  // List<Widget> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Resources.addNewCard),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MFormField(
                validator: (value) {
                  if (value.isEmpty) return Resources.pleaseEnterSomeText;
                  return null;
                },
                optional: false,
                controller: nameController,
                icon: Icon(Icons.person),
                hintText: Resources.name,
              ),
              MFormField(
                icon: Icon(Icons.bookmark),
                hintText: Resources.tag,
                controller: tagController,
              ),
              MFormField(
                icon: Icon(Icons.phone),
                hintText: Resources.phone,
                controller: phoneController,
              ),
              MFormField(
                icon: Icon(Icons.email),
                hintText: Resources.email,
                controller: emailController,
              ),
              MFormField(
                icon: Icon(MdiIcons.facebook),
                hintText: Resources.facebook,
                controller: facebookController,
              ),
              MFormField(
                icon: Icon(MdiIcons.instagram),
                hintText: Resources.instagram,
                controller: instagramController,
              ),
              MFormField(
                icon: Icon(MdiIcons.twitter),
                hintText: Resources.twitter,
                controller: twitterController,
              ),
              MFormField(
                icon: Icon(MdiIcons.snapchat),
                hintText: Resources.snapchat,
                controller: snapchatController,
              ),
              MFormField(
                icon: Icon(MdiIcons.wechat),
                hintText: Resources.wechat,
                controller: wechatController,
              ),
              MFormField(
                icon: Icon(MdiIcons.youtube),
                hintText: Resources.youtube,
                controller: youtubeController,
              ),
              MFormField(
                icon: Icon(MdiIcons.web),
                hintText: Resources.web,
                controller: webController,
              ),
              MFormField(
                  icon: Icon(Icons.location_on),
                  hintText: Resources.address,
                  controller: addressController),
              MFormField(
                icon: Icon(Icons.business),
                hintText: Resources.company,
                controller: companyController,
              ),
              MFormField(
                icon: Icon(MdiIcons.music),
                hintText: Resources.tiktok,
                controller: tiktokController,
              ),
              MFormField(
                icon: Icon(Icons.more_horiz),
                hintText: Resources.other,
                controller: otherController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _submitted(),
                  child: Text(
                    Resources.submit,
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
      if (wechatController.value.text != null &&
          wechatController.value.text != "") {
        contacts.add(Contact("wechat", wechatController.value.text));
      }
      if (youtubeController.value.text != null &&
          youtubeController.value.text != "") {
        contacts.add(Contact("youtube", youtubeController.value.text));
      }
      if (webController.value.text != null && webController.value.text != "") {
        contacts.add(Contact("web", webController.value.text));
      }
      if (addressController.value.text != null &&
          addressController.value.text != "") {
        contacts.add(Contact("address", addressController.value.text));
      }
      if (companyController.value.text != null &&
          companyController.value.text != "") {
        contacts.add(Contact("company", companyController.value.text));
      }
      if (tiktokController.value.text != null &&
          tiktokController.value.text != "") {
        contacts.add(Contact("tiktok", tiktokController.value.text));
      }
      if (otherController.value.text != null &&
          otherController.value.text != "") {
        contacts.add(Contact("other", otherController.value.text));
      }
      print(contacts);
      Hive.box("cards").add(ContactCard(
        contacts,
        nameController.value.text,
        tagController.value.text ?? "",
      ));
      if (Hive.box("favorite").isEmpty) {
        Hive.box("favorite").add(Hive.box("cards").getAt(0));
      }
      Router.sailor.pop();
    }
  }
}
