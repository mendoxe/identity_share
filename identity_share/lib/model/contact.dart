import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String value;

  Contact(this.type, this.value);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  Icon getIcon() {
    Icon icon;
    if (type.contains("email")) {
      icon = Icon(
        Icons.email,
        color: Colors.deepPurple,
      );
    }
    if (type.contains("phone")) {
      icon = Icon(
        Icons.phone,
        color: Colors.deepPurple,
      );
    }
    if (type.contains("facebook")) {
      icon = Icon(
        MdiIcons.facebook,
        color: Colors.blue,
      );
    }
    if (type.contains("instagram")) {
      icon = Icon(
        MdiIcons.instagram,
        color: Colors.pink,
      );
    }
    if (type.contains("twitter")) {
      icon = Icon(
        MdiIcons.twitter,
        color: Colors.blueAccent,
      );
    }
    if (type.contains("snapchat")) {
      icon = Icon(
        MdiIcons.snapchat,
        color: Colors.yellow,
      );
    }
    return icon ?? Icon(Icons.ac_unit);
  }
}
