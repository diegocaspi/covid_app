import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about_app_dialog.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impostazioni'),
      ),
      body: Column(
        children: <Widget>[
          _buildAboutUs(),
          _buildContactUs(),
          _buildPackageInfo()
        ],
      ),
    );
  }

  Widget _buildPackageInfo() {
    return ListTile(
      title: Text("Informazioni"),
      subtitle: Text('Informazioni sulle licenze e sulla versione dell\'applicazione'),
      onTap: () async {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        showDialog(
            context: context,
            builder: (context) => AboutAppDialog(
                  packageInfo: packageInfo,
                ));
      },
    );
  }

  Widget _buildAboutUs() {
    return ListTile(
      title: Text(
        "Chi siamo",
      ),
      subtitle: Text(
        "Premi per scoprirlo",
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return SimpleDialog(
              title: Text('Chi Siamo'),
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text("Diego Caspi"),
                          subtitle: Text("Sviluppo"),
                        ),
                        ListTile(
                          title: Text("Riccardo Calligaro"),
                          subtitle: Text("Aiuto sviluppo"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Studenti dell'ITIS ZUCCANTE di Mestre, percorso Informatica e Telecomunicazioni",
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildContactUs() {
    return ListTile(
      title: Text(
        "Contattaci",
      ),
      subtitle: Text(
        "Aiutaci a risolvere eventuali bug nell'applicazione",
      ),
      enabled: true,
      onTap: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return SimpleDialog(
                title: Text("Contattaci"),
                children: <Widget>[
                  SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Diego Caspi'),
                    ),
                    onPressed: () {
                      _launchURL("diego.caspi@zuccante.it");
                    },
                  ),
                  SimpleDialogOption(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Riccardo Calligaro'),
                    ),
                    onPressed: () {
                      _launchURL("riccardocalligaro@gmail.com");
                    },
                  )
                ],
              );
            });
      },
    );
  }

  _launchURL(String toMailId) async {
    var subject = "Applicazione COVID 19";
    var body = "Descrizione del bug/problema: ";
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
