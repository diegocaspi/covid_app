import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final int index;
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final Color textColor;
  final Widget centerWidget;

  const ContentCard({
    Key key,
    @required this.index,
    this.backgroundColor,
    @required this.title,
    @required this.subtitle,
    @required this.centerWidget,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: centerWidget,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildBottomContent(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    bool isHorizontal =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (index == 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          !isHorizontal
            ? Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      if (i == index) ...[circleBar(true, context)] else
                        circleBar(false, context),
                  ],
                ),
              )
            : Container(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 14.0),
                child: Text(
                  'INIZIA',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: .8,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        !isHorizontal
            ? Container(
                margin: EdgeInsets.only(bottom: 45),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 4; i++)
                      if (i == index) ...[circleBar(true, context)] else
                        circleBar(false, context),
                  ],
                ),
              )
            : Container(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.2,
            fontSize: 30.0,
            color: textColor,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
        index == 3
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Inizia',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: .8,
                        fontWeight: FontWeight.w600,
                        color: textColor ?? Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            : SizedBox(
                height: isHorizontal ? 40 : 70,
              )
      ],
    );
  }

  Widget circleBar(bool isActive, BuildContext context) {
    Color color;
    Color buttonsColor;
    if (textColor != null) {
      color = textColor;
      buttonsColor = textColor;
    } else {
      color = isActive
          ? Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black
          : Colors.transparent;

      buttonsColor = Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 9,
      width: 9,
      decoration: BoxDecoration(
        color: isActive ? color : Colors.transparent,
        border: Border.all(color: buttonsColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}