import 'package:fl_animated_linechart/chart/animated_line_chart.dart';
import 'package:fl_animated_linechart/chart/line_chart.dart';
import 'package:flutter/material.dart';

class HomeGraphsList extends StatelessWidget {
  final Map<String, Map<DateTime, int>> convertedData;
  const HomeGraphsList({
    Key key,
    @required this.convertedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          graph: _buildGraphicTotaleNuoviContagiati(convertedData, context),
        ),
        _buildChart(
          title: "Totale dimessi",
          graph: _buildGraphicTotaleDimessi(convertedData, context),
        ),
        _buildChart(
          title: "Totale terapia intensiva",
          graph: _buildGraphicTotaleTerapiaIntensiva(convertedData, context),
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
      Map<String, Map<DateTime, int>> convertedData, BuildContext context) {
    Map<DateTime, double> line1 = {};
    convertedData['positivi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale attualmente contagiati'],
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
      Map<String, Map<DateTime, int>> convertedData, BuildContext context) {
    Map<DateTime, double> line1 = {};
    convertedData['deceduti'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Deceduti'],
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
      Map<String, Map<DateTime, int>> convertedData, BuildContext context) {
    Map<DateTime, double> line1 = {};
    convertedData['dimessi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Dimessi'],
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

  Widget _buildGraphicTotaleNuoviContagiati(
      Map<String, Map<DateTime, int>> convertedData, BuildContext context) {
    Map<DateTime, double> line1 = {};
    convertedData['nuovi_positivi'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Nuovi Contagiati'],
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

  Widget _buildGraphicTotaleTerapiaIntensiva(
      Map<String, Map<DateTime, int>> convertedData, BuildContext context) {
    Map<DateTime, double> line1 = {};
    convertedData['terapia_intensiva'].forEach((k, v) {
      line1.putIfAbsent(k, () => v.toDouble());
    });

    LineChart chart;
    chart = LineChart.fromDateTimeMaps(
        [line1], [Colors.blue], ['Totale Terapia Intensiva'],
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
}
