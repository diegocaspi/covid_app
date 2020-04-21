import 'dart:math';
import 'package:covid_app/data/value_container.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
// ignore: implementation_imports
import 'package:charts_flutter/src/text_element.dart' as ChartText;
// ignore: implementation_imports
import 'package:charts_flutter/src/text_style.dart' as style;

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  final ValueContainer value;
  final BuildContext parentContext;


  CustomCircleSymbolRenderer(this.value, this.parentContext): super();

  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
        Color fillColor,
        FillPatternType fillPattern,
        Color strokeColor,
        double strokeWidthPx}) {
    super.paint(canvas, bounds, dashPattern: dashPattern, fillColor: fillColor, strokeColor: strokeColor, strokeWidthPx: strokeWidthPx);
    var textStyle = style.TextStyle();
    textStyle.color = charts.ColorUtil.fromDartColor(Theme.of(parentContext).primaryTextTheme.caption.color);
    textStyle.fontSize = 15;
    canvas.drawText(
        ChartText.TextElement(value.value.toString(), style: textStyle),
        (bounds.left).round(),
        (bounds.top - 50).round()
    );
  }
}