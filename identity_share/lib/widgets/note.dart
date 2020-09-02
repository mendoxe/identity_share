import 'package:flutter/material.dart';
import 'package:identity_share/utils/resources.dart';
import 'package:identity_share/utils/router.dart';

class Note extends StatefulWidget {
  const Note({Key key}) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Resources.moreInfo,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: Resources.addNote,
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.check_circle,
            size: 35,
            color: Colors.deepOrange,
          ),
          onPressed: () => _submit(),
        ),
      ],
    );
  }

  void _submit() {
    if (_controller.text != null || _controller.text != "") {
      Router.sailor.pop(_controller.text);
    }
    Router.sailor.pop();
  }
}
