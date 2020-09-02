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
  static String wechat;
  static String youtube;
  static String tiktok;
  static String address;
  static String web;
  static String company;
  static String moreInfo;
  static String addNote;

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
        wechat = "WeChat";
        youtube = "YouTube";
        tiktok = "TikTok";
        address = "Adresa";
        web = "Web";
        company = "Společnost";
        moreInfo = "Přidat další informace.";
        addNote = "Přidat poznámku...";
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
        wechat = "WeChat";
        youtube = "YouTube";
        tiktok = "TikTok";
        address = "Address";
        web = "Web";
        company = "Company";
        moreInfo = "Add additional information.";
        addNote = "Add a note...";
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
