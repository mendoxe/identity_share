import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact_card.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/widgets/contact_card_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  String _selectedTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
        valueListenable: Hive.box("contacts").listenable(),
        builder: (context, value, child) => Hive.box("contacts").length > 0
            ? ListView.builder(
                itemCount: Hive.box("contacts").length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return _tagsSelector();
                  if (_selectedTag != null &&
                      Hive.box("contacts").getAt(index - 1).tag !=
                          _selectedTag) {
                    return const SizedBox.shrink();
                  }
                  return ContactCardWidget(
                    card: Hive.box("contacts").getAt(index - 1),
                    myCard: false,
                    index: index,
                  );
                },
              )
            : Center(
                child: Text(
                  Resources.noContactsStored,
                  style: TextStyle(fontSize: 16),
                ),
              ),
      ),
    );
  }

  Widget _tagsSelector() {
    List<String> tags = Hive.box("contacts")
        .values
        .map((e) => (e as ContactCard).tag)
        .where((element) => element != null)
        .toSet()
        .toList();

    return Container(
      height: tags.isEmpty ? 0 : 64,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _tag(tags[index]),
      ),
    );
  }

  Widget _tag(String tag) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: _selectedTag == tag ? Colors.deepPurple : Colors.transparent,
        child: OutlineButton(
          child: Text(
            tag,
            style: TextStyle(
              color: _selectedTag == tag ? Colors.white : Colors.black,
            ),
          ),
          onPressed: () {
            setState(() {
              _selectedTag != tag ? _selectedTag = tag : _selectedTag = null;
            });
          },
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
