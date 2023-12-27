// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_preview.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonPreviewAdapter extends TypeAdapter<PersonPreview> {
  @override
  final int typeId = 2;

  @override
  PersonPreview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonPreview(
      adult: fields[0] as bool,
      gender: fields[1] as int,
      id: fields[2] as int,
      knownForDepartment: fields[3] as String,
      name: fields[4] as String,
      originalName: fields[5] as String,
      popularity: fields[6] as double,
      profilePath: fields[7] as String,
      knownFor: (fields[8] as List).cast<Movie>(),
    );
  }

  @override
  void write(BinaryWriter writer, PersonPreview obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.knownFor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonPreviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
