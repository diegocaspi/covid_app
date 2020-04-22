import 'package:covid_app/data/label_list.dart';
import 'package:covid_app/presentation/bloc/covid_data_bloc.dart';
import 'package:covid_app/presentation/features/charts/graphs_list.dart';
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
              return _buildLoaded(state.convertedData);
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
      Map<String, Map<DateTime, int>> convertedData) {
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
                  Text('Oggi in Italia\nDati del giorno: ${formatter.format(convertedData['positivi'].keys.last)}'),
                  _buildData(context, convertedData),
                  GraphsList(convertedData: convertedData,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildData(BuildContext context,
      Map<String, Map<DateTime, int>> convertedData) {

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: (Theme.of(context).brightness == Brightness.light)?10:5,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (List<String> l in LabelLists.card_labels) Column(
                    children: <Widget>[
                      Text(
                        "Totale ${l[0]}: ${convertedData[l[1]].values.last.toString()}",
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
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
