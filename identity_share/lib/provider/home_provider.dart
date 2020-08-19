import 'package:flutter/material.dart';
import 'package:identity_share/model/contact_card.dart';

class HomeProvider extends ChangeNotifier {
  ContactCard _selectedCard;
  bool _myCard;
  int _index;

  ContactCard get selectedCard => _selectedCard;

  bool get myCard => _myCard;

  int get index => _index;

  void selectCard(ContactCard card) {
    _selectedCard = card;
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
