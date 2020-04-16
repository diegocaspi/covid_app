import 'package:covid_app/utils/utils.dart';

void main() {
  String date = "2020-02-24T18:00:00";

  DateTime time = Utils.convertStringToDate(date);
  print(time);
}