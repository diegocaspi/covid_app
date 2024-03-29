import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../data/linear_data.dart';
import 'components/time_series_chart.dart';


class GraphsList extends StatelessWidget {
  final Map<String, Map<DateTime, int>> convertedData;

  const GraphsList({
    Key key,
    @required this.convertedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List dataCharts = [
      ["Totale attualmente contagiati", 'positivi'],
      ["Totale deceduti", 'deceduti'],
      ["Totale dimessi", 'dimessi'],
      ["Totale nuovi casi", 'nuovi_positivi'],
      ["Totale terapia intensiva", 'terapia_intensiva']
    ];

    return Column(
      children: <Widget>[
        for(var d in dataCharts) _buildChart(
            title: d[0],
            data: _createData(convertedData, d[1], context),
            context: context
        )
      ],
    );
  }

  Widget _buildChart({
    @required String title,
    @required List<charts.Series> data,
    @required BuildContext context
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
            child: Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: CustomTimeSeriesChart(data),
            )
        ),
      ],
    );
  }


  List<charts.Series<GraphData, DateTime>> _createData(Map<String, Map<DateTime, int>> convertedData, String label, BuildContext context){
    List<GraphData> data = [];
    convertedData[label].forEach((k, v) {
      data.add(GraphData(k, v.toDouble()));
    });

    return [
      charts.Series<GraphData, DateTime>(
        id: label,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Theme.of(context).accentColor),
        domainFn: (GraphData sales, _) => sales.datetime,
        measureFn: (GraphData sales, _) => sales.people,
        data: data,
      )
    ];
  }
}
