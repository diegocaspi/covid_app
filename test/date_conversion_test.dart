import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/core/di/injection_container.dart' as di;

void main() {
  group("test get bool", () {
    test("test get bool", () async {
      await di.init();
      CovidDataRepository imp = di.sl();

      print(imp.getBool('first_start'));
    });
  });
  
}