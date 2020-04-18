
import 'package:covid_app/data/local/moor_database.dart';

abstract class CovidDataRepository{

  bool getBool(String key);

  setBool(String key, bool value);

  Stream<List<CovidData>> watchAllCovidData();

  Future<List<CovidData>> getAllCovidData();

  Future<List<CovidData>> getDataFromRegion(String region);

  Future updateCovidData();

  Future deleteAllCovidData();
}