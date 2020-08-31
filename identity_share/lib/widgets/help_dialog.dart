import 'package:flutter/material.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: screenSize.width * 0.8,
        height: 450,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: 100,
                height: 100,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
                child: Text(
              "MEETKA",
              style: TextStyle(fontSize: 18),
            )),
            const SizedBox(height: 16.0),
            _textHeadline("Dávej"),
            const SizedBox(height: 6.0),
            _textPoint(
                "1. Vytvoř si vlastní profil (hvězdičkou\n označ právě používaný)"),
            _textPoint("2. Ukaž QR kód nově poznané osobě"),
            const SizedBox(height: 32.0),
            _textHeadline("Získávej"),
            const SizedBox(height: 6.0),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Row(
                children: [
                  Text("1. Naskenuj QR kód tlačítkem"),
                  const SizedBox(width: 4.0),
                  Icon(Icons.camera_alt),
                ],
              ),
            ),
            _textPoint("2. V sekci Kontakty najdeš nový kontakt"),
            _textPoint("3. Přidávej poznámky a tvoř skupiny\n dle libosti"),
          ],
        ),
      ),
    );
  }

  Widget _textHeadline(String text) {
    return Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ));
  }

  Widget _textPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
