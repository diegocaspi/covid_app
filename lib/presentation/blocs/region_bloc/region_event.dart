part of 'region_bloc.dart';

@immutable
abstract class RegionBlocEvent {}

class GetRegionData extends RegionBlocEvent {
  final String region;

  GetRegionData({@required this.region});
}
