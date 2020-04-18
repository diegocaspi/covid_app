import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/data/local/moor_database.dart';
import 'package:covid_app/domain/repositories/covid_datas_repository.dart';
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
    if(event is GetAllCovidData){
      yield* _mapGetAllCovidDataToState();

    } else if(event is GetCovidDataFromRegion){
      yield* _mapGetCovidDataFromRegionToState(event.region);

    } else {
      yield* _mapUpdateAllCovidData();
    }
  }

  Stream<CovidDataState> _mapGetAllCovidDataToState() async* {
    yield CovidDataNotLoadIn();

    try{
      final data = await covidDataRepository.getAllCovidData();
      
      yield CovidDataLoaded(datas: data, italy: true, region: "italy");
    } catch (_) {
      yield CovidDataLoadError();
    }
  }

  Stream<CovidDataState> _mapGetCovidDataFromRegionToState(String region) async* {
    yield CovidDataNotLoadIn();

    try{
      final data = await covidDataRepository.getDataFromRegion(region);
      yield CovidDataLoaded(datas: data, italy: false, region: region);
    } catch (_) {
      yield CovidDataLoadError();
    }
  }

  Stream<CovidDataState> _mapUpdateAllCovidData() async* {
    yield CovidDataNotUpdated();

    try{
      await covidDataRepository.updateCovidData();
      covidDataRepository.setBool("first_start", false);
      yield CovidDataUpdated();
    } catch (_) {
      yield CovidDataUpdateError();
    }
  }
}
