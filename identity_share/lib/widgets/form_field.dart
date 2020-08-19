import 'package:flutter/material.dart';

class MFormField extends StatelessWidget {
  const MFormField({
    Key key,
    @required this.icon,
    @required this.hintText,
    this.validator,
    this.optional = true,
    @required this.controller,
  }) : super(key: key);

  final bool optional;
  final Icon icon;
  final String hintText;
  final Function validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          helperText: !optional ? "Required" : null,
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
