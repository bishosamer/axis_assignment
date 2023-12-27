// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      adult: fields[0] as bool,
      alsoKnownAs: (fields[1] as List).cast<String>(),
      biography: fields[2] as String,
      birthday: fields[3] as String,
      deathday: fields[4] as String,
      gender: fields[5] as int,
      homepage: fields[6] as String,
      id: fields[7] as int,
      imdbId: fields[8] as String,
      knownForDepartment: fields[9] as String,
      name: fields[10] as String,
      placeOfBirth: fields[11] as String,
      popularity: fields[12] as double,
      profilePath: fields[13] as String,
      knownFor: (fields[14] as List).cast<Movie>(),
      imageUrls: (fields[15] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.alsoKnownAs)
      ..writeByte(2)
      ..write(obj.biography)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.deathday)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.imdbId)
      ..writeByte(9)
      ..write(obj.knownForDepartment)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.placeOfBirth)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.profilePath)
      ..writeByte(14)
      ..write(obj.knownFor)
      ..writeByte(15)
      ..write(obj.imageUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
