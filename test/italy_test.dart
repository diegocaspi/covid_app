import 'package:covid_app/data/repositories/covid_datas_repository_impl.dart';
import 'package:covid_app/domain/entities/covid_data.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/core/di/injection_container.dart' as di;
import 'package:covid_app/data/local/moor_database.dart';

void main() {
  group("italy test", () {
    test("italy test", () async {
      WidgetsFlutterBinding.ensureInitialized();

      await di.init();
      CovidDataRepositoryImpl imp = CovidDataRepositoryImpl(
        covidDataDao: di.sl(),
        networkInfo: di.sl(),
        sharedPreferences: di.sl(),
      );

      await imp.updateCovidData();

      List<CovidData> data = await imp.getAllCovidData();

      data.forEach((f) => print(f.data.toString() + f.name));
      /* List<CovidDataElement> covidDataElement = await imp.fetchData();
      Map<DateTime, int> italyTotPositivi = Utils.getItalyTotPositivi(
          Utils.getDailyMap(Utils.convertDataToDb(covidDataElement)));

      italyTotPositivi.forEach((k, v) => print('${k}: ${v}')); */
    });
  });
}
