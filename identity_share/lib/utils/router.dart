// Routes class is created by you.
import 'package:identity_share/screens/add_card/add_card.dart';
import 'package:identity_share/screens/contact_detail/contact_detail.dart';
import 'package:identity_share/screens/home/home_screen.dart';
import 'package:sailor/sailor.dart';

class Router {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: "/home",
      builder: (context, args, params) {
        return HomeScreen();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: "/contactDetail",
      builder: (context, args, params) {
        return ContactDetail();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: "/add",
      builder: (context, args, params) {
        return AddCard();
      },
    ));
  }
}
