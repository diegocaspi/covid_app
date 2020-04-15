
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/entities/covid_data.dart';

abstract class CovidDataRepository{

  Stream<List<CovidData>> watchAllCovidData();

  Future<List<CovidData>> getAllCovidData();

  Future<List<CovidData>> getDataFromRegion(String region);

  Future updateCovidData();

  Future deleteAllCovidData();
}