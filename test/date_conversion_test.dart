import 'package:covid_app/utils/utils.dart';

void main() {
  String date = "2020-02-24T18:00:00";

  Utils util = Utils();
  DateTime time = util.convertStringToDate(date);
  print(time);
}