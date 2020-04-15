import 'package:covid_app/data/local/daos/covid_data_dao.dart';
import 'package:covid_app/data/local/tables/covid_data_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

@UseMoor(tables: [
  CovidDatas,
],
daos: [
  CovidDataDao,
])
class AppDatabase extends _$AppDatabase{
  AppDatabase()
    : super(
      (FlutterQueryExecutor.inDatabaseFolder(
        path: 'db.sqlite',
        logStatements: true,
        )),
    );

  @override
  int get schemaVersion => 1;

  //delete everything from database
  Future resetDb() async {
    for(var table in allTables){
      await delete(table).go();
    }
  }
}