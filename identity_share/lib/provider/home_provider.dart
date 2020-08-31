import 'package:flutter/material.dart';
import 'package:identity_share/model/contact_card.dart';

class HomeProvider extends ChangeNotifier {
  ContactCard _selectedCard;
  ContactCard _fav;
  bool _myCard;
  int _index;
  bool _preview;

  bool get preview => _preview;

  ContactCard get selectedCard => _selectedCard;

  ContactCard get fav => _fav;

  bool get myCard => _myCard;

  int get index => _index;

  void isPreview(bool bl) {
    _preview = bl;
    notifyListeners();
  }

  void selectCard(ContactCard card) {
    _selectedCard = card;
    notifyListeners();
  }

  void favCard(ContactCard card) {
    _fav = card;
    notifyListeners();
  }

  void setMyCard(bool my) {
    _myCard = my;
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
