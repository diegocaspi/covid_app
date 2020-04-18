part of 'region_bloc.dart';

@immutable
abstract class RegionState {}

class RegionDataInitial extends RegionState {}

class RegionDataLoadInProgress extends RegionState {}

class RegionDataLoadSuccess extends RegionState {
  final Map<DateTime, List<CovidData>> data;
  final List<CovidData> dataList;

  RegionDataLoadSuccess({@required this.data, @required this.dataList});
}

class RegionDataLoadErorr extends RegionState {}
