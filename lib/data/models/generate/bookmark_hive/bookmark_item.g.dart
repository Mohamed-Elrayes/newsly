// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkHiveAdapter extends TypeAdapter<BookmarkHive> {
  @override
  final int typeId = 1;

  @override
  BookmarkHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkHive(
      author: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      url: fields[3] as String?,
      source: fields[4] as String?,
      image: fields[5] as String?,
      category: fields[6] as String?,
      language: fields[7] as String?,
      country: fields[8] as String?,
      publishedAt: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.author)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.source)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
