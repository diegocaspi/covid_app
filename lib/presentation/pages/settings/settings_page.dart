import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: <Widget>[
          _buildAboutUs(),
          _buildContactUs(),
        ],
      ),
    );
  }

  Widget _buildAboutUs(){
    return Container(
      height: 80.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(
          const Radius.circular(20.0),
        ),
        border: Border.all(),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text("Chi siamo",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),
        ),
        subtitle: Text(
          "Premi per scoprire chi siamo",
          style: GoogleFonts.roboto(
            fontSize: 20
          ),
        ),
        enabled: true,
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return SimpleDialog(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "CHI SIAMO?",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Siamo Diego Caspi e Riccardo Calligaro",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Due studenti dell'ITIS ZUCCANTE di Mestre, percorso Informatica e Telecomunicazioni",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }

  Widget _buildContactUs(){
    return Container(
      height: 80.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(
          const Radius.circular(20.0),
        ),
        border: Border.all(),
        color: Colors.white,
      ),
      child: ListTile(
        title: Text("Contattaci",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),
        ),
        subtitle: Text(
          "Premi per contattarci se trovi bug nell'applicazione",
          style: GoogleFonts.roboto(
            fontSize: 20
          ),
        ),
        enabled: true,
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return SimpleDialog(
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "CONTATTACI",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Se trovi bug nell'app contattaci ai seguenti indirizzi mail",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Email Diego: diego.caspi@zuccante.it",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Email Riccardo: riccardo.calligaro@zuccante.it",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          );
        },
      ),
    );
  }
}