import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/entities/covid_data.dart';

class CovidDataMapper{
  static CovidData convertToDb(CovidDataElement e){
    return CovidData(
      //id: null,
      data: e.data,
      name: e.name,
      totPositivi: e.totPositivi,
      deceduti: e.deceduti,
      dimessiGuariti: e.dimessiGuariti,
      terapiaIntensiva: e.terapiaIntensiva,
      nuoviPositivi: e.nuoviPositivi,
      );
  }
}