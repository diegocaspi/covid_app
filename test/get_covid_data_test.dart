
import 'package:covid_app/data/repositories/covid_datas_repository_impl.dart';
import 'package:covid_app/domain/entities/covid_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test", (){
    test("test", () async {
      CovidDataRepositoryImpl repo = CovidDataRepositoryImpl();

      List<CovidDataElement> l = await repo.fetchData();

      l.forEach((e) => print(e.name));
    });
  });
}