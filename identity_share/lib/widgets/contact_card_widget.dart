import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/provider/home_provider.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/utils/router.dart';
import 'package:provider/provider.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget(
      {Key key,
      @required this.card,
      @required this.myCard,
      @required this.index})
      : super(key: key);

  final ContactCard card;
  final bool myCard;
  final int index;

  @override
  Widget build(BuildContext context) {
    int itemCount = 0;
    if (card.contacts.length == 1) itemCount = 1;
    if (card.contacts.length > 1) itemCount = 2;
    bool fav =
        (context.watch<HomeProvider>().fav ?? Hive.box("favorite").getAt(0)) ==
            card;

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
      child: InkWell(
        onTap: () {
          context.read<HomeProvider>().selectCard(card);
          context.read<HomeProvider>().setMyCard(myCard);
          context.read<HomeProvider>().setIndex(index);
          context.read<HomeProvider>().isPreview(false);
          Router.sailor("/contactDetail");
        },
        child: Card(
          child: Container(
            width: double.infinity,
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
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
                    card.tag != ""
                        ? Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, top: 6.0),
                            child: Text(
                              card.tag,
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : const SizedBox.shrink(),
                    fav
                        ? Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, top: 6.0),
                            child: Icon(Icons.star, color: Colors.deepOrange),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Divider(indent: 8, endIndent: 8),
                Expanded(
                  child: itemCount != 0
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: itemCount,
                          itemBuilder: (context, index) => _contactHolder(
                            card.contacts[index],
                          ),
                        )
                      : Center(child: Text(Resources.onlyNameProvided)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactHolder(Contact contact) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 4.0),
      child: Container(
          height: 50,
          child: Row(
            children: [
              contact.getIcon(),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.value,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    contact.type,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
