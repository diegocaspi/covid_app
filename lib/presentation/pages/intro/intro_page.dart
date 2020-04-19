import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:covid_app/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CovidDataBloc, CovidDataState> (
        listener: (context, state) {
          if(state is CovidDataUpdated){
            RepositoryProvider.of<CovidDataRepository>(context).setBool("first_start", false);
            //BlocProvider.of<CovidDataBloc>(context).add(GetAllCovidData());
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BeforeHomePage(),
            ));
          }
        },
        child: BlocBuilder<CovidDataBloc, CovidDataState>(
          builder: (context, state) {
            if(state is CovidDataNotUpdated){
              return _buildInitial();
            } else if(state is CovidDataUpdating){
              return _buildUpdating();
            } else if(state is CovidDataUpdateError){
              return _buildError();
            }
            return Scaffold();
          },
        ),
      ),
    );
  }

  Widget _buildInitial(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Premi sul bottone per avviare la sincronizzazione iniziale",
            style: TextStyle(
              fontSize: 25.0,
              
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            textColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(16.0),
            onPressed: () {
              BlocProvider.of<CovidDataBloc>(context).add(UpdateCovidData());
            },
            child: Text(
              "INIZIA",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUpdating(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            size: 81,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Errore nello scaricamento dei dati'),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            child: Text('Riprova'.toUpperCase()),
            onPressed: () {
              BlocProvider.of<CovidDataBloc>(context).add(
                UpdateCovidData(),
              );
            },
          )
        ],
      ),
    );
  }
}