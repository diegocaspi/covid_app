import 'package:covid_app/presentation/pages/home/dialog/select_region_dialog.dart';
import 'package:covid_app/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        _topSection(context),
      ],
    );
  }

  Widget _topSection(BuildContext context){
    final hour = TimeOfDay.fromDateTime(DateTime.now());

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 42, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _getMessageFromHour(hour),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    _todayDate(DateTime.now()),
                    style: TextStyle(
                          color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                    },
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          _buildBox(context),
        ],
      ),
    );
  }

  Widget _buildBox(BuildContext context){
    return Card(
      margin: EdgeInsets.zero,
      child: Center(
        child: Container(
          height: double.infinity,
          //width: double.infinity,
          padding: const EdgeInsets.all(0.0),
          child: FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              "Seleziona regione",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context, builder: (context) => RegionsDialog()
              );
            },
          ),
        ),
      ),
    );
  }

  String _getMessageFromHour(TimeOfDay time){
    if (time.hour < 13) return 'Buona mattina.';
    if (time.hour < 18) return 'Buon pomeriggio.';
    return 'Buona serata.';
  }

  String _todayDate(DateTime date){
    var formatter = new DateFormat.yMMMMd('en_US');
    return formatter.format(date);
  }
}