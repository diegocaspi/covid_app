import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:covid_app/presentation/pages/home/home_page.dart';
import 'package:covid_app/presentation/pages/home/topbar/top_bar.dart';
import 'package:covid_app/presentation/pages/region/region_page.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  final Map<String, Map<DateTime, int>> italyData;
  final List<CovidData> data;
  final RefreshController _refreshController = RefreshController();

  HomePage({@required this.italyData, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
            listeners: [
          BlocListener<CovidDataBloc, CovidDataState>(
            listener: (context, state) {
              if (state is CovidDataLoaded) {
                if (state.italy == false) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        RegionPage(datas: state.datas, region: state.region),
                  ));
                }
              }
            },
          )
        ],
            child: SmartRefresher(
              controller: _refreshController,
              header: MaterialClassicHeader(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]
                    : Colors.white,
                color: Colors.lightBlue,
              ),
              onRefresh: () => _refreshPage(context),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TopBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                    ),
                    Center(
                      child: Text(
                        "OGGI IN ITALIA",
                        style: GoogleFonts.roboto(
                          fontSize: 70.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _buildData(),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Grafico Totale Contagiati",
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.redAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: _buildGraphicTotaleContagiati(),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Grafico Totale Deceduti",
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.redAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: _buildGraphicTotaleDeceduti(),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Grafico Totale Dimessi",
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.redAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: _buildGraphicTotaleDimessi(),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Grafico Totale Nuovi Contagiati",
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.redAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: _buildGraphicTotaleNuoviContagiati(),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Grafico Totale Terapia Intensiva",
                                  style: GoogleFonts.lato(
                                      fontSize: 30, color: Colors.redAccent),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: _buildGraphicTotaleTerapiaIntensiva(),
                              ),
                            ])),
                  ],
                ),
              ),
            )));
  }

  Widget _buildData() {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                      italyData['deceduti']
                          .values
                          .elementAt(italyData['deceduti'].values.length - 1)
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale attualmente positivi: " +
                      italyData['positivi']
                          .values
                          .elementAt(italyData['positivi'].values.length - 1)
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale guariti: " +
                      italyData['dimessi']
                          .values
                          .elementAt(italyData['dimessi'].values.length - 1)
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale terapia intensiva: " +
                      italyData['terapia_intensiva']
                          .values
                          .elementAt(
                              italyData['terapia_intensiva'].values.length - 1)
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Totale nuovi contagiati di oggi: " +
                      italyData['nuovi_positivi']
                          .values
                          .elementAt(
                              italyData['nuovi_positivi'].values.length - 1)
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ));
  }

  Widget _buildGraphicTotaleContagiati() {
    Map<DateTime, double> line1 = {};
    italyData['positivi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    /* line1.putIfAbsent(DateTime.now(), () => 3.0);
    line1.putIfAbsent(DateTime(2019, 3, 2), () => 10.0);
    line1.putIfAbsent(DateTime(2019, 4, 2), () => 20.0); */

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDeceduti() {
    Map<DateTime, double> line1 = {};
    italyData['deceduti'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    /* line1.putIfAbsent(DateTime.now(), () => 3.0);
    line1.putIfAbsent(DateTime(2019, 3, 2), () => 10.0);
    line1.putIfAbsent(DateTime(2019, 4, 2), () => 20.0); */

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Deceduti'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDimessi() {
    Map<DateTime, double> line1 = {};
    italyData['dimessi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    /* line1.putIfAbsent(DateTime.now(), () => 3.0);
    line1.putIfAbsent(DateTime(2019, 3, 2), () => 10.0);
    line1.putIfAbsent(DateTime(2019, 4, 2), () => 20.0); */

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Dimessi'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleNuoviContagiati() {
    Map<DateTime, double> line1 = {};
    italyData['nuovi_positivi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    /* line1.putIfAbsent(DateTime.now(), () => 3.0);
    line1.putIfAbsent(DateTime(2019, 3, 2), () => 10.0);
    line1.putIfAbsent(DateTime(2019, 4, 2), () => 20.0); */

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Nuovi Contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleTerapiaIntensiva() {
    Map<DateTime, double> line1 = {};
    italyData['terapia_intensiva'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    /* line1.putIfAbsent(DateTime.now(), () => 3.0);
    line1.putIfAbsent(DateTime(2019, 3, 2), () => 10.0);
    line1.putIfAbsent(DateTime(2019, 4, 2), () => 20.0); */

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Terapia Intensiva'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 300,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  void _refreshPage(BuildContext context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BeforeHomePage()));
    await Future.delayed(Duration(milliseconds: 500));
    _refreshController.refreshCompleted();
  }
}
