import 'package:covid_app/core/network/network_info.dart';
import 'package:covid_app/data/local/daos/covid_data_dao.dart';
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/entities/covid_data.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';

class CovidDataRepositoryImpl implements CovidDataRepository{

  CovidDataDao covidDataDao;
  NetworkInfo networkInfo;

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

  }

  @override
  Future deleteAllCovidData(){
    return covidDataDao.deleteAllCovidData();
  }

  @override
  Future updateCovidData() async {
    if(await networkInfo.isConnected){
      final data = await covidDataDao.getAllCovidData();

      List<CovidData> list = [];

      //TODO: COMPLETE
    }
  }
}