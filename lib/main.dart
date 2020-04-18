import 'package:bloc/bloc.dart';
import 'package:covid_app/core/simple_bloc_delegate.dart';
import 'package:covid_app/data/repositories/covid_datas_repository_impl.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:covid_app/presentation/blocs/region_bloc/region_bloc.dart';
import 'package:covid_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/di/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  initApp();
  runApp(MyApp());
  initializeDateFormatting('it_IT');
}

void initApp() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _setSystemUI();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CovidDataRepository>(
          create: (context) => CovidDataRepositoryImpl(
            covidDataDao: di.sl(),
            networkInfo: di.sl(),
            sharedPreferences: di.sl(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CovidDataBloc>(
            create: (context) => CovidDataBloc(covidDataRepository: di.sl()),
          ),
          BlocProvider<RegionBloc>(
            create: (context) => RegionBloc(covidDataRepository: di.sl()),
          )
        ],
        child: MaterialApp(
          title: 'Covid-19 Trend',
          theme: ThemeData(
            backgroundColor: Color(0xffF4F5F9),
            primaryColor: Color(0xff3377F9),
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            fontFamily: 'San Francisco UI',
            iconTheme: IconThemeData(
              color: Color(0xff3377F9),
            ),
          ),
          home: SplashPage(),
        ),
      ),
    );
  }

  _setSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}
