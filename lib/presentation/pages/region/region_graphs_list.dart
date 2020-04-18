import 'package:fl_animated_linechart/chart/animated_line_chart.dart';
import 'package:fl_animated_linechart/chart/line_chart.dart';
import 'package:flutter/material.dart';

import '../../../data/local/moor_database.dart';

class RegionGraphsList extends StatelessWidget {
  final Map<DateTime, List<CovidData>> convertedData;

  const RegionGraphsList({
    Key key,
    @required this.convertedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildChart(
          title: "Totale attualmente contagiati",
          graph: _buildGraphicTotaleContagiati(convertedData, context),
        ),
        _buildChart(
          title: "Totale deceduti",
          graph: _buildGraphicTotaleDeceduti(convertedData, context),
        ),
        _buildChart(
          title: "Totale dimessi",
          graph: _buildGraphicTotaleDimessi(convertedData, context),
        ),
        _buildChart(
          title: "Totale nuovi contagiati",
          graph: _buildGraphicNuoviContagiati(convertedData, context),
        ),
        _buildChart(
          title: "Totale dimessi",
          graph: _buildGraphicTotaleDimessi(convertedData, context),
        ),
        _buildChart(
          title: "Totale terapia intensiva",
          graph: _buildGraphicTerapiaIntensiva(convertedData, context),
        )
      ],
    );
  }

  Widget _buildChart({
    @required String title,
    @required Widget graph,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: graph,
        ),
      ],
    );
  }

  Widget _buildGraphicTotaleContagiati(
      Map<DateTime, List<CovidData>> map, BuildContext context) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(
          k, () => v.elementAt(v.length - 1).totPositivi.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDeceduti(
      Map<DateTime, List<CovidData>> map, BuildContext context) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(k, () => v.elementAt(v.length - 1).deceduti.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale deceduti'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTotaleDimessi(
      Map<DateTime, List<CovidData>> map, BuildContext context) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(
          k, () => v.elementAt(v.length - 1).dimessiGuariti.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale dimessi'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicNuoviContagiati(
      Map<DateTime, List<CovidData>> map, BuildContext context) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(
          k, () => v.elementAt(v.length - 1).nuoviPositivi.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale nuovi contagiati'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }

  Widget _buildGraphicTerapiaIntensiva(
      Map<DateTime, List<CovidData>> map, BuildContext context) {
    Map<DateTime, double> line = {};

    map.forEach((k, v) {
      line.putIfAbsent(
          k, () => v.elementAt(v.length - 1).terapiaIntensiva.toDouble());
    });
    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line], [Colors.blue], ['Totale terapia intensiva'],
        tapTextFontWeight: FontWeight.w400);

    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    );
  }
}
