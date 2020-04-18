import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/presentation/bloc/covid_data_bloc.dart';
import 'package:covid_app/presentation/pages/home/true_home_page.dart';
import 'package:covid_app/presentation/pages/region/region_page.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeforeHomePage extends StatefulWidget {
  BeforeHomePage({Key key}) : super(key: key);

  @override
  _BeforeHomePageState createState() => _BeforeHomePageState();
}

class _BeforeHomePageState extends State<BeforeHomePage> {

  Map<String, Map<DateTime, int>> italyData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CovidDataBloc>(context).add(GetAllCovidData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<CovidDataBloc, CovidDataState>(
            listener: (context, state) {
              if(state is CovidDataLoaded){
                  italyData = Utils.getItalyFullMap(state.datas);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(italyData: italyData, data: state.datas),
                  ));
              }
            },
            child: BlocBuilder<CovidDataBloc, CovidDataState>(
              builder: (context, state) {
                if(state is CovidDataNotLoaded){
                  return Scaffold();
                } else if(state is CovidDataNotLoadIn){
                  return _buildUpdating();
                } else {
                  //error state
                  return _buildUpdating();
                }
              },
            ),
          ),
        ],
        child: _buildUpdating(),
      ),
    );
  }

  Widget _buildUpdating(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}