import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CovidDataElement extends Equatable {

  final DateTime data;
  final String denominazione_regione;
  final int totale_positivi;
  final int deceduti;
  final int dimessi_guariti;
  final int terapia_intensiva;
  final int nuovi_positivi;

  CovidDataElement({
  @required this.data,
  @required this.denominazione_regione,
  @required this.totale_positivi,
  @required this.deceduti,
  @required this.dimessi_guariti,
  @required this.terapia_intensiva,
  @required this.nuovi_positivi,
  }) : super([data, denominazione_regione, totale_positivi, deceduti, dimessi_guariti, terapia_intensiva, nuovi_positivi]);

}