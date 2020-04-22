import 'package:covid_app/data/label_list.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../../data/linear_data.dart';
import 'components/time_series_chart.dart';


class GraphsList extends StatelessWidget {
  final Map<String, Map<DateTime, int>> convertedData;

  const GraphsList({
    Key key,
    @required this.convertedData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        shrinkWrap: true,
        cacheExtent: 300.0,
        physics: NeverScrollableScrollPhysics(),
        itemCount: LabelLists.graph_label.length,
        itemBuilder: (context, i) => _buildChart(
            values: LabelLists.graph_label[i],
            context: context
        )
    );
  }

  Widget _buildChart({
    @required List<dynamic> values,
    @required BuildContext context
  }) {
    List<charts.Series> data = _createData(convertedData, values[1], context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          values[0],
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
