part of 'covid_data_bloc.dart';

@immutable
abstract class CovidDataState extends Equatable{
  @override
  List<Object> get props => null;
}

class CovidDataNotLoaded extends CovidDataState {}

class CovidDataNotLoadIn extends CovidDataState {}

class CovidDataLoaded extends CovidDataState{
  final List<CovidData> datas;

  CovidDataLoaded({
    @required this.datas,
  });
}

class CovidDataLoadError extends CovidDataState{}