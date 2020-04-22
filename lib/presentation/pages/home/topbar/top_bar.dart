import 'package:covid_app/presentation/pages/home/dialog/select_region_dialog.dart';
import 'package:covid_app/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = TimeOfDay.fromDateTime(DateTime.now());

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   color: Theme.of(context).primaryColor,
          // ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _getMessageFromHour(hour),
                        style: TextStyle(fontSize: 23),
                      ),
                      Text(
                        _todayDate(DateTime.now()),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 50.0,
            child: RaisedButton(
              elevation: 10,
              onPressed: () => showDialog(
                    context: context, builder: (context) => RegionsDialog()
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Color(0xff64B6FF)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text(
                    'Visualizza per regione',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getMessageFromHour(TimeOfDay time) {
    if (time.hour < 13) return 'Buona mattina.';
    if (time.hour < 18) return 'Buon pomeriggio.';
    return 'Buona serata.';
  }

  String _todayDate(DateTime date) {
    return DateFormat.yMMMMd('it_IT').format(date);
  }
}
