import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

TextEditingController heightControler = TextEditingController();
TextEditingController weightControler = TextEditingController();
double imcGraphicShow = 0;
double imcValue = 0;
double graphicResult = 0;
Color kPrimaryColor = Color(0XFF58CCDF);
Color kBackgroundColor = Color(0XFFEEEEEE);
Color kDarkColor = Color(0XFF58627C);
Color kLightColor = Color(0XFFEEEEEE);

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
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: kLightColor,
);
TextStyle kFlatButtonTS = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: kDarkColor,
);

Widget HeightField() {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Altura',
          style: kMegaTitleTS,
        ),
        Container(
          width: 46,
          child: TextFormField(
            controller: heightControler,
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: kTitleTS,
            maxLines: 1,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                labelStyle: kTitleTS,
                labelText: '0CM'.toUpperCase(),
                hintText: 'CM',
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
        color: kLightColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: kDarkColor.withOpacity(0.2),
              offset: Offset(5, 5),
              blurRadius: 15),
          BoxShadow(color: Colors.white, offset: Offset(-5, -5), blurRadius: 15)
        ]),
  );
}

Widget WeightField() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Peso',
          style: kMegaTitleTS,
        ),
        Container(
          width: 46,
          child: TextFormField(
            controller: weightControler,
            cursorColor: kPrimaryColor,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: kTitleTS,
            maxLines: 1,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                labelStyle: kTitleTS,
                labelText: '0KG'.toUpperCase(),
                hintText: 'KG',
                floatingLabelBehavior: FloatingLabelBehavior.never),
          ),
        )
      ],
    ),
    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    decoration: BoxDecoration(
        color: kLightColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: kDarkColor.withOpacity(0.2),
              offset: Offset(4, 4),
              blurRadius: 10),
          BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 15)
        ]),
  );
}

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
    decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: kDarkColor.withOpacity(0.3),
              offset: Offset(5, 5),
              blurRadius: 10),
          BoxShadow(color: Colors.white, offset: Offset(-5, -5), blurRadius: 15)
        ]),
  );
}

Widget MyCircularProgress(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.6,
    height: size.height * 0.6,
    child: CircularPercentIndicator(
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      radius: size.width * 0.55,
      lineWidth: 20,
      progressColor: kPrimaryColor,
      percent: imcGraphicShow,
      backgroundColor: kDarkColor.withOpacity(0.2),
      center: Text(
        '$imcGraphicShow',
        style: kResultTS,
      ),
    ),
  );
}
