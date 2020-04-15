import 'dart:convert';

import 'package:covid_app/core/network/network_info.dart';
import 'package:covid_app/data/local/daos/covid_data_dao.dart';
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/entities/covid_data.dart';
import 'package:covid_app/domain/entities/mapper/covid_data_mapper.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http/http.dart' as http;

class CovidDataRepositoryImpl implements CovidDataRepository{

  CovidDataDao covidDataDao;
  NetworkInfo networkInfo = NetworkInfoImpl(new DataConnectionChecker());

  @override
  Stream<List<CovidData>> watchAllCovidData(){
    return covidDataDao.watchAllCovidData();
  }

  @override
  Future<List<CovidData>> getAllCovidData(){
    return covidDataDao.getAllCovidData();
  }

  @override
  Future<List<CovidData>> getDataFromRegion(String region){
    return covidDataDao.getFromRegion(region);
  }

  @override
  Future deleteAllCovidData(){
    return covidDataDao.deleteAllCovidData();
  }

  @override
  Future updateCovidData() async {
    if(await networkInfo.isConnected){
      List<CovidDataElement> list = await fetchData();

      List<CovidData> insertElements = [];
      list.forEach((f) => insertElements.add(CovidDataMapper.convertToDb(f)));
      covidDataDao.updateAllCovidData(insertElements);
    }
  }

  Future<List<CovidDataElement>> fetchData() async {
    final response = await http.get("https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni.json");

    if(response.statusCode == 200){
      List<CovidDataElement> d = (json.decode(response.body) as List).map((e) => new CovidDataElement.fromJson(e)).toList();
      d.forEach((f) => print(f.name));
      return d;
    } else {
      throw Exception("Failed to load");
    }
  }
}