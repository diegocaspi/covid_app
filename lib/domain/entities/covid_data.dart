import 'package:covid_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class CovidDataElement {

  final DateTime data;
  final String name;
  final int totPositivi;
  final int deceduti;
  final int dimessiGuariti;
  final int terapiaIntensiva;
  final int nuoviPositivi;

  CovidDataElement({
  @required this.data,
  @required this.name,
  @required this.totPositivi,
  @required this.deceduti,
  @required this.dimessiGuariti,
  @required this.terapiaIntensiva,
  @required this.nuoviPositivi,
  });

  factory CovidDataElement.fromJson(Map<String, dynamic> json){
    return CovidDataElement(
      data: Utils.convertStringToDate(json['data']),
      name: json['denominazione_regione'],
      totPositivi: json['totale_positivi'],
      deceduti: json['deceduti'],
      dimessiGuariti: json['dimessi_guariti'],
      terapiaIntensiva: json['terapia_intensiva'],
      nuoviPositivi: json['nuovi_positivi'],
      );
  }

  @override
  String toString() {
    return "region: " + name + "\ndate: " + data.toString() + "\ntot positivi: " + totPositivi.toString() + 
    "\ndeceduti: " + deceduti.toString() + "\ndimessi: " + dimessiGuariti.toString() + "\nterapia intensiva: " + 
    terapiaIntensiva.toString() + "\nnuovi positivi: " + nuoviPositivi.toString();
  }
}