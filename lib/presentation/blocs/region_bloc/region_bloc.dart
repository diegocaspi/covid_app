import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/local/moor_database.dart';
import '../../../domain/repositories/covid_datas_repository.dart';
import '../../../utils/utils.dart';

part 'region_event.dart';
part 'region_state.dart';

class RegionBloc extends Bloc<RegionBlocEvent, RegionState> {
  CovidDataRepository covidDataRepository;

  RegionBloc({@required this.covidDataRepository});

  @override
  RegionState get initialState => RegionDataInitial();

  @override
  Stream<RegionState> mapEventToState(
    RegionBlocEvent event,
  ) async* {
    if (event is GetRegionData) {
      yield RegionDataLoadInProgress();
      try {
        final data = await covidDataRepository.getDataFromRegion(event.region);
        Map<DateTime, List<CovidData>> map = Utils.getDailyMap(data);
        yield RegionDataLoadSuccess(data: map, dataList: data);
      } catch (_) {
        yield RegionDataLoadErorr();
      }
    }
  }
}
