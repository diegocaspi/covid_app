import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
import 'package:covid_app/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'covid_data_event.dart';
part 'covid_data_state.dart';

class CovidDataBloc extends Bloc<CovidDataEvent, CovidDataState> {
  CovidDataRepository covidDataRepository;

  CovidDataBloc({
    @required this.covidDataRepository,
  });

  @override
  CovidDataState get initialState => CovidDataNotUpdated();

  @override
  Stream<CovidDataState> mapEventToState(
    CovidDataEvent event,
  ) async* {
    if (event is GetAllCovidData) {
      yield* _mapGetAllCovidDataToState();
    } else {
      yield* _mapUpdateAllCovidData();
    }
  }

  Stream<CovidDataState> _mapGetAllCovidDataToState() async* {
    yield CovidDataLoadInProgress();
    try {
      final repoData = await covidDataRepository.getAllCovidData();
      Map<String, Map<DateTime, int>> convertedData = Utils.getItalyFullMap(repoData);
      yield CovidDataLoaded(data: repoData, convertedData: convertedData, italy: true, region: "italy");
    } catch (_) {
      yield CovidDataLoadError();
    }
  }

  Stream<CovidDataState> _mapUpdateAllCovidData() async* {
    yield CovidDataNotUpdated();
    try {
      await covidDataRepository.updateCovidData();
      yield CovidDataUpdated();
    } catch (_) {
      yield CovidDataUpdateError();
    }
  }
}
