import 'package:hive/hive.dart';
import 'package:identity_share/utils/router.dart';

class ContactDetailController {
  void delete(bool my, int index, bool fav) {
    if (my) {
      Hive.box("cards").deleteAt(index);
    } else {
      Hive.box("contacts").deleteAt(index);
    }
    if (fav) {
      if (Hive.box("cards").isEmpty) {
        Hive.box("favorite").clear();
      } else {
        Hive.box("favorite").putAt(0, Hive.box("cards").getAt(0));
      }
    }
    Router.sailor.pop();
  }
}
