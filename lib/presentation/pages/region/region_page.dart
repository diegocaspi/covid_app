import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildPage(Map<DateTime, List<CovidData>> map){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _topSection(map),
          _graphicSection()
        ],
      ),
    );
  }

  Widget _topSection(Map<DateTime, List<CovidData>> map){
    return Padding(
            padding: const EdgeInsets.all(70.0),
            child: Column(
              children: <Widget>[
                Text(
                  region,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  )
                )
              ],
            ),
          );
    
  }

  Widget _graphicSection(){
    return Container(
      child: Column(
         children: <Widget>[
           Center(
             child: Padding(
               padding: const EdgeInsets.only(top: 30.0),
               child: Text(
                 "Totale deceduti: " 
               ),
             ),
           )
         ],
      ),
    );
  }
}