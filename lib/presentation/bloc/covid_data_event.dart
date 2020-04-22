part of 'covid_data_bloc.dart';

@immutable
abstract class CovidDataEvent extends Equatable{
  @override
  List<Object> get props => null;
}

class GetAllCovidData extends CovidDataEvent {}

class UpdateCovidData extends CovidDataEvent {}
