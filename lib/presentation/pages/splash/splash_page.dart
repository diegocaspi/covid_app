import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:covid_app/presentation/pages/home/home_page.dart';
import 'package:covid_app/presentation/pages/intro/intro_slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    final _firstStart = RepositoryProvider.of<CovidDataRepository>(context)
      .getBool('first_start') ?? true;

    if(_firstStart){
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroSlideShowPage()));
      });
    } else {
      BlocProvider.of<CovidDataBloc>(context).add(UpdateCovidData());
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BeforeHomePage()));
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}