import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/provider/home_provider.dart';
import 'package:identity_share/screens/contact_detail/components/contact_holder.dart';
import 'package:identity_share/utils/router.dart';
import 'package:provider/provider.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({Key key}) : super(key: key);

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  bool fav;
  ContactCard card;
  int index;
  bool my;

  @override
  Widget build(BuildContext context) {
    card = context.watch<HomeProvider>().selectedCard;
    my = context.watch<HomeProvider>().myCard;
    index = context.watch<HomeProvider>().index;
    fav = false;
    if (Hive.box("favorite").isNotEmpty) {
      fav = Hive.box("favorite").getAt(0) == card;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Router.sailor.pop(),
        ),
        actions: [
          my
              ? IconButton(
                  icon: Icon(
                    fav ? Icons.star : Icons.star_border,
                    color: Colors.white,
                  ),
                  onPressed: () => _fav(),
                )
              : const SizedBox.shrink(),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () => _delete(my),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black12))),
            child: Hero(
              tag: card,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  card.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.nunito().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: card.contacts.length,
              itemBuilder: (context, index) =>
                  ContactHolder(contact: card.contacts[index]),
            ),
          ),
        ],
      ),
    );
  }

  void _delete(bool my) {
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

  void _fav() {
    if (fav) return;
    setState(() {
      Hive.box("favorite").putAt(0, card);
      fav = true;
    });
  }
}
