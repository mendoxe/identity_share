// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactCardAdapter extends TypeAdapter<ContactCard> {
  @override
  final int typeId = 1;

  @override
  ContactCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactCard(
      (fields[1] as List)?.cast<Contact>(),
      fields[0] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactCard obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.contacts)
      ..writeByte(3)
      ..write(obj.tag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactCard _$ContactCardFromJson(Map<String, dynamic> json) {
  return ContactCard(
    (json['contacts'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
    json['tag'] as String,
  );
}

Map<String, dynamic> _$ContactCardToJson(ContactCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'contacts': instance.contacts?.map((e) => e?.toJson())?.toList(),
      'tag': instance.tag,
    };
