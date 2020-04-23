import 'package:covid_app/core/regions.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../region/region_page.dart';
import 'noglow_behavior.dart';

class RegionsDialog extends StatelessWidget {
  const RegionsDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regions = Regions.regions;

    return AlertDialog(
      title: Text("Seleziona una regione"),
      content: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(regions.length, (index) {
              final region = regions[index];
              return ListTile(
                title: Text(region),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      PageTransition(child: RegionPage(region: region), type: PageTransitionType.rightToLeft)
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
