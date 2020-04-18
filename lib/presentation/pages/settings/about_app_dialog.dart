import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutAppDialog extends StatelessWidget {
  final PackageInfo packageInfo;
  const AboutAppDialog({
    Key key,
    @required this.packageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      applicationIcon: Icon(Icons.school),
      applicationName: 'Covid 19',
      applicationVersion: packageInfo.version,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            final url = 'https://github.com/diegocaspi/covid_app';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  text: 'Repository github',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
