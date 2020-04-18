import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegionPage extends StatelessWidget {
  //the region that we have to see data
  final String region;
  final List<CovidData> datas;

  //constructor
  RegionPage({
    @required this.region,
    @required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<CovidData>> map = Utils.getDailyMap(datas);

    return Scaffold(
      body: _buildPage(map),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildPage(Map<DateTime, List<CovidData>> map) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.all(
                  const Radius.circular(30.0),
                )),
            child: Center(
              child: _topSection(),
            ),
          ),
          Center(
            child: _middleSection(),
          ),
          _graphicSection(map)
        ],
      ),
    );
  }

  Widget _topSection() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 70.0, right: 50.0, left: 50.0, bottom: 20.0),
      child: Container(
          decoration: new BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: new BorderRadius.all(
                const Radius.circular(40.0),
              )),
          //color: Colors.white,
          width: 500,
          height: 120,
          child: Center(
            child: Text(
              region,
              style: TextStyle(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }

  Widget _middleSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: new BorderRadius.all(
              const Radius.circular(40.0),
            )),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale deceduti: " +
                      datas.elementAt(datas.length - 1).deceduti.toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale attualmente positivi: " +
                      datas.elementAt(datas.length - 1).totPositivi.toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale dimessi: " +
                      datas
                          .elementAt(datas.length - 1)
                          .dimessiGuariti
                          .toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale terapia intensiva: " +
                      datas
                          .elementAt(datas.length - 1)
                          .terapiaIntensiva
                          .toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale nuovi contagiati di oggi: " +
                      datas
                          .elementAt(datas.length - 1)
                          .nuoviPositivi
                          .toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _graphicSection(Map<DateTime, List<CovidData>> map) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "Grafico Totale Contagiati",
              style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _buildGraphicTotaleContagiati(map),
          ),
          Center(
            child: Text(
              "Grafico Totale Deceduti",
              style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _buildGraphicTotaleDeceduti(map),
          ),
          Center(
            child: Text(
              "Grafico Totale Dimessi",
              style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _buildGraphicTotaleDimessi(map),
          ),
          Center(
            child: Text(
              "Grafico Totale Nuovi Contagiati",
              style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _buildGraphicNuoviContagiati(map),
          ),
          Center(
            child: Text(
              "Grafico Totale Terapia Intensiva",
              style: GoogleFonts.lato(fontSize: 30, color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: _buildGraphicTerapiaIntensiva(map),
          )
        ],
      ),
    );
  }

  Widget _buildGraphicTotaleContagiati(Map<DateTime, List<CovidData>> map) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).totPositivi.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDeceduti(Map<DateTime, List<CovidData>> map) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).deceduti.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale deceduti'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDimessi(Map<DateTime, List<CovidData>> map) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).dimessiGuariti.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale dimessi'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicNuoviContagiati(Map<DateTime, List<CovidData>> map) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).nuoviPositivi.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale nuovi contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTerapiaIntensiva(Map<DateTime, List<CovidData>> map) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).terapiaIntensiva.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale terapia intensiva'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }
}
