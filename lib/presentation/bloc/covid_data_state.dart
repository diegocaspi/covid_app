part of 'covid_data_bloc.dart';

@immutable
abstract class CovidDataState extends Equatable {
  @override
  List<Object> get props => null;
}

class CovidDataNotLoaded extends CovidDataState {}

class CovidDataLoadInProgress extends CovidDataState {}

class CovidDataLoaded extends CovidDataState {
  final Map<String, Map<DateTime, int>> convertedData;

  CovidDataLoaded({
    @required this.convertedData,
  });
}

class CovidDataLoadError extends CovidDataState {}

class CovidDataNotUpdated extends CovidDataState {}

class CovidDataUpdating extends CovidDataState {}

class CovidDataUpdated extends CovidDataState {}

class CovidDataUpdateError extends CovidDataState {}
