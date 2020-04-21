import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/presentation/bloc/covid_data_bloc.dart';
import 'package:covid_app/presentation/features/charts/graphs_list.dart';
import 'package:covid_app/presentation/global/theme/bloc/bloc.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bloc/bloc.dart';
import 'topbar/top_bar.dart';

class BeforeHomePage extends StatefulWidget {
  BeforeHomePage({Key key}) : super(key: key);

  @override
  _BeforeHomePageState createState() => _BeforeHomePageState();
}

class _BeforeHomePageState extends State<BeforeHomePage> {
  RefreshController _refreshController;
  var formatter = new DateFormat.yMMMMd('it_IT');
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
    BlocProvider.of<CovidDataBloc>(context).add(GetAllCovidData());
  }

  @override
  Widget build(BuildContext context) {
    var instance = BlocProvider.of<ThemeBloc>(context).state;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[850]
          : Colors.white,
      body: BlocListener<CovidDataBloc, CovidDataState>(
        listener: (context, state) {
          if (state is CovidDataUpdated) {
            _refreshController.refreshCompleted();
            BlocProvider.of<CovidDataBloc>(context).add(GetAllCovidData());
          } else if (state is CovidDataUpdateError) {
            _refreshController.refreshFailed();
          }
        },
        child: BlocBuilder<CovidDataBloc, CovidDataState>(
          builder: (context, state) {
            if (state is CovidDataLoaded) {
              final convertedData = Utils.getItalyFullMap(state.datas);
              return _buildLoaded(convertedData, state.datas);
            } else if (state is CovidDataLoadInProgress) {
              return _buildUpdating();
            } else {
              return _buildUpdating();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoaded(
      Map<String, Map<DateTime, int>> convertedData, List<CovidData> datas) {
    return SmartRefresher(
      controller: _refreshController,
      header: MaterialClassicHeader(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        color: Theme.of(context).primaryColor,
      ),
      onRefresh: () => _refreshPage(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Oggi in Italia\nDati del giorno: ' +
                  formatter.format(convertedData['positivi'].keys.elementAt(
                    convertedData['positivi'].keys.length - 1)).toString()
                  ),
                  _buildData(context, convertedData, datas),
                  GraphsList(
                    convertedData: convertedData,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildData(BuildContext context,
      Map<String, Map<DateTime, int>> convertedData, List<CovidData> datas) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Totale deceduti: " +
                        convertedData['deceduti']
                            .values
                            .elementAt(
                                convertedData['deceduti'].values.length - 1)
                            .toString(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Totale attualmente positivi: " +
                        convertedData['positivi']
                            .values
                            .elementAt(
                                convertedData['positivi'].values.length - 1)
                            .toString(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Totale guariti: " +
                        convertedData['dimessi']
                            .values
                            .elementAt(
                                convertedData['dimessi'].values.length - 1)
                            .toString(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Totale terapia intensiva: " +
                        convertedData['terapia_intensiva']
                            .values
                            .elementAt(convertedData['terapia_intensiva']
                                    .values
                                    .length -
                                1)
                            .toString(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Totale nuovi casi di oggi: " +
                        convertedData['nuovi_positivi']
                            .values
                            .elementAt(
                                convertedData['nuovi_positivi'].values.length -
                                    1)
                            .toString(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _refreshPage(BuildContext context) async {
    BlocProvider.of<CovidDataBloc>(context).add(UpdateCovidData());
    _refreshController.refreshCompleted();
  }

  Widget _buildUpdating() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
