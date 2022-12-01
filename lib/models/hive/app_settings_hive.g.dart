// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsHiveAdapter extends TypeAdapter<AppSettingsHive> {
  @override
  final int typeId = 1;

  @override
  AppSettingsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingsHive()
      ..clockColor = fields[0] as int
      ..appBackgroundColor = fields[1] as int
      ..useRadarForSecondHand = fields[2] as bool
      ..dateFormat = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, AppSettingsHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.clockColor)
      ..writeByte(1)
      ..write(obj.appBackgroundColor)
      ..writeByte(2)
      ..write(obj.useRadarForSecondHand)
      ..writeByte(3)
      ..write(obj.dateFormat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
