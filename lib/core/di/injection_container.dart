import 'package:covid_app/core/network/network_info.dart';
import 'package:covid_app/data/local/daos/covid_data_dao.dart';
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/data/repositories/covid_datas_repository_impl.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/presentation/blocs/home_bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(
    () => CovidDataBloc(
      covidDataRepository: sl()
    ),
  );

  //databse
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<CovidDataDao>(() => CovidDataDao(sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //repository
  sl.registerLazySingleton<CovidDataRepository>(
    () => CovidDataRepositoryImpl(
      covidDataDao: sl(),
      networkInfo: sl(),
      sharedPreferences: sl(),
      ),
  );

  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => DataConnectionChecker());

  //External
  //SharedPreferences.setMockInitialValues({});
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}