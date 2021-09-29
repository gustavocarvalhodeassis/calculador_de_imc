import 'package:calculador_de_iimc/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Color kPrimaryColor = Color(0XFF58CCDF);
Color kBackgroundColor = Color(0XFFEEEEEE);
Color kDarkColor = Color(0XFF58627C);
Color kLightColor = Color(0XFFEEEEEE);

Decoration kDecorationCtn(double borderRd, double darkShadowOpacity,
    double offset, double blured, Color color) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRd),
      boxShadow: [
        BoxShadow(
            color: kDarkColor.withOpacity(darkShadowOpacity),
            offset: Offset(offset, offset),
            blurRadius: blured),
        BoxShadow(
            color: Colors.white,
            offset:
                Offset(offset - (offset + offset), offset - (offset + offset)),
            blurRadius: blured)
      ]);
}

TextStyle kAppBarTitleTS = TextStyle(
  fontSize: 22,
  color: kDarkColor,
  fontWeight: FontWeight.w600,
);
TextStyle kMegaTitleTS = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w200,
  color: kDarkColor,
);
TextStyle kResultTS = TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.w200,
  color: kDarkColor,
);
TextStyle kTitleTS = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w200,
  color: kDarkColor,
);
TextStyle kMiniTitleTS = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w200,
  color: kDarkColor,
);
TextStyle kGrifTextTS = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: kPrimaryColor,
);
TextStyle kButtonTS = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: kLightColor,
);
TextStyle kFlatButtonTS = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: kDarkColor,
);

Widget MyButton(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    alignment: Alignment.center,
    width: size.width * 1,
    child: Text(
      'Ver resultados',
      style: kButtonTS,
    ),
    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
    decoration: kDecorationCtn(20, 0.3, 5, 10, kPrimaryColor),
  );
}

Widget MyCircularProgress(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.6,
    height: size.height * 0.6,
    child: CircularPercentIndicator(
      animationDuration: 1000,
      curve: Curves.easeInOutQuart,
      animateFromLastPercent: true,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      radius: size.width * 0.55,
      lineWidth: 20,
      progressColor: graphicColor,
      percent: graphicResult,
      backgroundColor: kDarkColor.withOpacity(0.2),
      center: Text(
        '$graphicMiddleText',
        style: kResultTS,
      ),
    ),
  );
}

Widget MyDrawer() {
  return Drawer(
      child: SafeArea(
    child: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Criador \nGustavo Carvalho',
            style: TextStyle(
                color: kDarkColor, fontSize: 30, fontWeight: FontWeight.w200),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/img/exatas-logo.png',
              scale: 15,
            ),
            Padding(padding: EdgeInsets.only(left: 5)),
            Text('Exatas',
                style: TextStyle(
                    color: kDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ]),
          Padding(padding: EdgeInsets.only(top: 20)),
          Divider(
            color: kDarkColor.withOpacity(0.5),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 60,
              decoration: kDecorationCtn(15, 0.2, 3, 5, kLightColor),
              child: Text(
                'Sobre o App',
                style: kTitleTS,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 60,
              decoration: kDecorationCtn(15, 0.2, 3, 5, kLightColor),
              child: Text(
                'Sobre a exatas',
                style: kTitleTS,
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
