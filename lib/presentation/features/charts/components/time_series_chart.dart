import 'package:charts_flutter/flutter.dart';
import 'package:covid_app/data/linear_data.dart';
import 'package:covid_app/data/value_container.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import 'custom_symbol_render.dart';

class CustomTimeSeriesChart extends StatefulWidget {
  final List<charts.Series> data;

  CustomTimeSeriesChart(this.data, {Key key}) : super(key: key);

  @override
  _CustomTimeSeriesChartState createState() => _CustomTimeSeriesChartState();
}

class _CustomTimeSeriesChartState extends State<CustomTimeSeriesChart> {
  ValueContainer tapValue = ValueContainer('');

  _onSelectionChanged(charts.SelectionModel model) {
    if(model.hasDatumSelection){
      GraphData selectedDatum = model.selectedDatum.first.datum;
      var date = DateFormat.MMMd('it').format(selectedDatum.datetime);
      setState(() => tapValue.value = '$date\n${selectedDatum.people.toInt().toString()}');
    }else{
      setState(() => tapValue.value = '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      widget.data,
      animate: true,
      domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Theme.of(context).primaryTextTheme.caption.color),
              )
          )
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Theme.of(context).primaryTextTheme.caption.color),
              )
          )
      ),
      behaviors: [
        charts.SelectNearest(eventTrigger: charts.SelectionTrigger.pressHold),
        charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag),
        LinePointHighlighter(
            showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
            showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
            symbolRenderer: CustomCircleSymbolRenderer(tapValue, context)
        ),
      ],
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: _onSelectionChanged,
        )
      ],
      defaultInteractions: true,
    );
  }
}


