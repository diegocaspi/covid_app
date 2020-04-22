part of 'region_bloc.dart';

@immutable
abstract class RegionState {}

class RegionDataInitial extends RegionState {}

class RegionDataLoadInProgress extends RegionState {}

class RegionDataLoadSuccess extends RegionState {
  final Map<String, Map<DateTime, int>> data;

  RegionDataLoadSuccess({@required this.data});
}

class RegionDataLoadErorr extends RegionState {}
