import 'package:hive/hive.dart';

class Resources {
  static String scan;
  static String contacts;
  static String profile;
  static String onlyNameProvided;
  static String rrequired;
  static String smthngWentWrong;
  static String pleaseCreateCard;
  static String createCardBy;
  static String noContactsStored;
  static String addNewCard;
  static String pleaseEnterSomeText;
  static String name;
  static String phone;
  static String email;
  static String instagram;
  static String facebook;
  static String twitter;
  static String snapchat;
  static String submit;
  static String tag;
  static String add;
  static String other;

  void init(Language lang) {
    Hive.box("preferences").put("lang", langToString(lang));
    switch (lang) {
      case Language.CZ:
        scan = "Skenování";
        contacts = "Kontakty";
        profile = "Profil";
        onlyNameProvided = "Bylo nastaveno pouze jméno.";
        rrequired = "Povinné";
        smthngWentWrong = "Něco se pokazilo.";
        pleaseCreateCard = "Prosím vytvořte kartu.";
        createCardBy = "Vytvořte kartu kliknutím na oranžové tlačitko s +.";
        noContactsStored = "Žádné kontakty.";
        addNewCard = "přidat kartu";
        pleaseEnterSomeText = 'Musíte napsat nějaký text';
        email = "Email";
        name = "Jméno";
        phone = "Telefon";
        instagram = "Instagram";
        facebook = "Facebook";
        snapchat = "Snapchat";
        twitter = "Twitter";
        other = "Jiné";
        submit = 'Submit';
        tag = "tag";
        add = "add";
        return;

      case Language.EN:
        scan = "Scan";
        contacts = "Contacts";
        profile = "Profile";
        onlyNameProvided = "Only name was provided.";
        rrequired = "Required";
        smthngWentWrong = "Something went wrong.";
        pleaseCreateCard = "Please create a card.";
        createCardBy = "Create card by hitting the orange button with +.";
        noContactsStored = "No contacts stored.";
        addNewCard = "Add new card.";
        pleaseEnterSomeText = 'Please enter some text.';
        email = "Email";
        name = "Name";
        phone = "Phone";
        instagram = "Instagram";
        facebook = "Facebook";
        snapchat = "Snapchat";
        twitter = "Twitter";
        other = "Other";
        submit = 'Submit';
        tag = "tag";
        add = "Přidat";
        return;
    }
  }
}

enum Language {
  EN,
  CZ,
}

Language getLang(String lang) {
  if (lang == "EN") return Language.EN;
  if (lang == "CZ") return Language.CZ;
  return Language.EN;
}

String langToString(Language lang) {
  if (lang == Language.EN) return "EN";
  if (lang == Language.CZ) return "CZ";
  return "EN";
}