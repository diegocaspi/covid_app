import 'package:covid_app/presentation/pages/home/home_page.dart';
import 'package:covid_app/presentation/pages/intro/intro_page.dart';
import 'package:covid_app/presentation/pages/intro/slides/content_page.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class IntroSlideShowPage extends StatefulWidget {
  IntroSlideShowPage({Key key}) : super(key: key);

  @override
  _IntroSlideShowPageState createState() => _IntroSlideShowPageState();
}

class _IntroSlideShowPageState extends State<IntroSlideShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => LiquidSwipe(
          fullTransitionValue: 300,
          enableLoop: false,
          pages: <Container>[
            Container(
              child: ContentCard(
                index: 0,
                title: "Informazioni",
                subtitle: "Scopri l'andamento del Covid-19 in Italia",
                centerWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 150,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),
            Container(
              child: ContentCard(
                index: 1,
                title: "La tua regione",
                subtitle: "Tieni d'occhi l'andamento del Covid-19 in ogni regione italiana",
                centerWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 150,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),
            Container(
              child: ContentCard(
                index: 2,
                title: "Forza Italia!",
                subtitle: "Tutti insieme ce la possiamo fare!",
                centerWidget: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 150,
                ),
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),
            Container(
              child: IntroPage(),
            )
          ],
        ),
        ),
    );
  }
}