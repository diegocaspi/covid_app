import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/data/local/tables/covid_data_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'covid_data_dao.g.dart';

@UseDao(tables: [CovidDatas])
class CovidDataDao extends DatabaseAccessor<AppDatabase> with _$CovidDataDaoMixin {
  final AppDatabase db;

  CovidDataDao(this.db) : super(db);

  Future<List<CovidData>> getAllCovidData() => select(covidDatas).get();
  Future<List<CovidData>> getFromRegion(String data) {
    return (select(covidDatas)..where((dato) => dato.name.equals(data))).get();
  }
  Stream<List<CovidData>> watchAllCovidData() => select(covidDatas).watch();
  Future insertEvent(CovidData data) => into(covidDatas).insert(data, orReplace: true);
  
  Future updateCovidData(CovidData data) => update(covidDatas).replace(data);
  Future deleteCovidData(CovidData data) => delete(covidDatas).delete(data);

  Future updateAllCovidData(List<CovidData> data) async {
    await batch((b) {
      b.insertAll(covidDatas, data);
    });
  }
  Future deleteAllCovidData() => delete(covidDatas).go();
}