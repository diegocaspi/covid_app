part of 'covid_data_bloc.dart';

@immutable
abstract class CovidDataEvent extends Equatable {
  CovidDataEvent([List props = const <dynamic>[]]) : super(props);
}

class GetAllCovidData extends CovidDataEvent {}

class GetCovidDataFromRegion extends CovidDataEvent {
  String region;

  GetCovidDataFromRegion({
    @required this.region,
  });
}
