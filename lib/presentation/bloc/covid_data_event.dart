part of 'covid_data_bloc.dart';

@immutable
abstract class CovidDataEvent extends Equatable{
  @override
  List<Object> get props => null;
}

class GetAllCovidData extends CovidDataEvent {}

class GetCovidDataFromRegion extends CovidDataEvent {
  final String region;

  GetCovidDataFromRegion({
    @required this.region,
  });
}
