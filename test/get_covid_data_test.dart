import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/data/repositories/covid_datas_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test", (){
    test("test", () async {
      CovidDataRepositoryImpl repo;
      await repo.updateCovidData();

      List<CovidData> l = await repo.getAllCovidData();

      l.forEach((f) => print(f.toString()));
    });
  });
}