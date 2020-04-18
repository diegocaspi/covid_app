import 'package:moor_flutter/moor_flutter.dart';

class CovidDatas extends Table{
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get data => dateTime()();
  IntColumn get totPositivi => integer()();
  IntColumn get deceduti => integer()();
  IntColumn get dimessiGuariti => integer()();
  IntColumn get terapiaIntensiva => integer()();
  IntColumn get nuoviPositivi => integer()();

  @override
  Set<Column> get primaryKey => {id};
}