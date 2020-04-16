import 'package:covid_app/core/regions.dart';
import 'package:covid_app/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionsDialog extends StatelessWidget {
  const RegionsDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final regions = Regions.regions;

    return AlertDialog(
      title: Text("Seleziona una regione"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(regions.length, (index) {
            final region = regions[index];
            return ListTile(
              title: Text(region),
              onTap: () {
                Navigator.pop(context);

                BlocProvider.of<CovidDataBloc> (context).add(
                  GetCovidDataFromRegion(region: region)
                );
              },
            );
          }),
        ),
      ),
    );
  }
}