import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:covid_app/presentation/pages/home/topbar/top_bar.dart';
import 'package:covid_app/presentation/pages/region/region_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final Map<String, Map<DateTime, int>> italyData;
  final List<CovidData> data;

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
      child: Column(
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
              style: GoogleFonts.mcLaren(
                fontSize: 70.0,
              ),
            ),
          ),
          _buildData(),
          _buildGraphics(),
        ],
      ),
    ));
  }

  Widget _buildData() {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
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
            )
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Totale positivi: " +
                    italyData['positivi']
                        .values
                        .elementAt(italyData['positivi'].values.length - 1)
                        .toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ) 
          ),
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
            ) 
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Totale terapia intensiva: " +
                    italyData['terapia_intensiva']
                        .values
                        .elementAt(italyData['terapia_intensiva'].values.length - 1)
                        .toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ) 
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Totale nuovi contagiati: " +
                    italyData['nuovi_positivi']
                        .values
                        .elementAt(italyData['nuovi_positivi'].values.length - 1)
                        .toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ) 
          ),
        ],
      ),
    );
  }

  Widget _buildGraphics(){
    List<charts.Series> seriesList;
    return new charts.LineChart(seriesList);
  }
}
