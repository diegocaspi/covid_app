
import 'package:covid_app/domain/entities/covid_data.dart';

class Utils{

  Map<String, List<CovidDataElement>> getDailyMap(List<CovidDataElement> data){
    Map<String, List<CovidDataElement>> ret = new Map();
    data.forEach((element) {
      ret[element.data].add(element);
    });
    return ret;
  }
}