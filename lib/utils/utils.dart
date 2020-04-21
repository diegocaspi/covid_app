import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/entities/covid_data.dart';
import 'package:covid_app/domain/entities/mapper/covid_data_mapper.dart';
import 'package:flutter/material.dart';

class Utils {
  static Map<DateTime, List<CovidData>> getDailyMap(List<CovidData> data) {
    Map<DateTime, List<CovidData>> ret = new Map();
    data.forEach((element) {
      if (ret[element.data] != null) {
        ret[element.data].add(element);
      } else {
        ret[element.data] = [element];
      }
    });
    return ret;
  }

  static Map<String, Map<DateTime, int>> getItalyFullMap(List<CovidData> data) {
    Map<String, Map<DateTime, int>> ret = new Map();

    Map<DateTime, List<CovidData>> dailyMap = getDailyMap(data);

    ret['positivi'] = getItalyTotPositivi(dailyMap);
    ret['deceduti'] = getItalyDeceduti(dailyMap);
    ret['dimessi'] = getItalyDimessi(dailyMap);
    ret['terapia_intensiva'] = getItalyTerapiaIntensiva(dailyMap);
    ret['nuovi_positivi'] = getItalyNuoviPositivi(dailyMap);

    return ret;
  }

  static Map<String, Map<DateTime, int>> getRegionMap(Map<DateTime, List<CovidData>> data) {
    Map<String, Map<DateTime, int>> ret = new Map();

    ret['positivi'] = new Map();
    ret['deceduti'] = new Map();
    ret['dimessi'] = new Map();
    ret['terapia_intensiva'] = new Map();
    ret['nuovi_positivi'] = new Map();

    data.forEach((k, v) {
      ret['positivi'].putIfAbsent(k, () => v[0].totPositivi);
      ret['deceduti'].putIfAbsent(k, () => v[0].deceduti);
      ret['dimessi'].putIfAbsent(k, () => v[0].dimessiGuariti);
      ret['terapia_intensiva'].putIfAbsent(k, () => v[0].terapiaIntensiva);
      ret['nuovi_positivi'].putIfAbsent(k, () => v[0].nuoviPositivi);
    });

    return ret;
  }

  static List<CovidData> convertDataToDb(List<CovidDataElement> data) {
    List<CovidData> ret = [];
    data.forEach((f) => ret.add(CovidDataMapper.convertToDb(f)));
    return ret;
  }

  static DateTime convertStringToDate(String date) {
    return DateTime.parse(date);
  }

  static Map<DateTime, int> getItalyTotPositivi(
      Map<DateTime, List<CovidData>> source) {
    Map<DateTime, int> ret = {};
    source.forEach((k, v) {
      int tot = 0;
      v.forEach((f) => tot += f.totPositivi);
      ret[k] = tot;
    });
    return ret;
  }

  static Map<DateTime, int> getItalyDeceduti(
      Map<DateTime, List<CovidData>> source) {
    Map<DateTime, int> ret = {};
    source.forEach((k, v) {
      int tot = 0;
      v.forEach((f) => tot += f.deceduti);
      ret[k] = tot;
    });
    return ret;
  }

  static Map<DateTime, int> getItalyDimessi(
      Map<DateTime, List<CovidData>> source) {
    Map<DateTime, int> ret = {};
    source.forEach((k, v) {
      int tot = 0;
      v.forEach((f) => tot += f.dimessiGuariti);
      ret[k] = tot;
    });
    return ret;
  }

  static Map<DateTime, int> getItalyTerapiaIntensiva(
      Map<DateTime, List<CovidData>> source) {
    Map<DateTime, int> ret = {};
    source.forEach((k, v) {
      int tot = 0;
      v.forEach((f) => tot += f.terapiaIntensiva);
      ret[k] = tot;
    });
    return ret;
  }

  static Map<DateTime, int> getItalyNuoviPositivi(
      Map<DateTime, List<CovidData>> source) {
    Map<DateTime, int> ret = {};
    source.forEach((k, v) {
      int tot = 0;
      v.forEach((f) => tot += f.nuoviPositivi);
      ret[k] = tot;
    });
    return ret;
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
