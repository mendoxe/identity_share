import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:identity_share/model/contact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_card.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class ContactCard {
  @HiveField(0)
  final String name;
  @HiveField(1)
  List<Contact> contacts;
  @HiveField(3)
  String tag;

  ContactCard(this.contacts, this.name, this.tag);

  factory ContactCard.fromJson(Map<String, dynamic> json) =>
      _$ContactCardFromJson(json);
  Map<String, dynamic> toJson() => _$ContactCardToJson(this);

  @override
  bool operator ==(Object other) {
    if (this.name != (other as ContactCard).name) return false;
    if (this.contacts.length != (other as ContactCard).contacts.length)
      return false;
    List<String> values = this.contacts.map((e) => e.value).toList();
    List<String> otherValues =
        (other as ContactCard).contacts.map((e) => e.value).toList();

    values.forEach((element) {
      if (!otherValues.contains(element)) return false;
    });

    return true;
  }
}
