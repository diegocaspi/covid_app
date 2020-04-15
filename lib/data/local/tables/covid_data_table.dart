import 'package:moor_flutter/moor_flutter.dart';

class CovidDatas extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get denominazione_regione => text()();
  DateTimeColumn get data => dateTime()();
  IntColumn get totale_positivi => integer()();
  IntColumn get deceduti => integer()();
  IntColumn get dimessi_guariti => integer()();
  IntColumn get terapia_intensiva => integer()();
  IntColumn get nuovi_positivi => integer()();

  @override
  Set<Column> get primaryKey => {id};
}