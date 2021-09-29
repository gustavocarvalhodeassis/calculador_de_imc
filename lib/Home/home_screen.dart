import 'dart:ffi';
import 'dart:ui';

import 'package:calculador_de_iimc/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

String imcWeightTextErros = '';
String imcHeightTextErros = '';
bool hasHeightError = false;
bool hasWeightError = false;
String imcText = 'Seu IMC aparecerá aqui!';
double graphicResult = 0.0001;
String graphicMiddleText = '0';
var graphicColor = Color(0XFF58CCDF);
var erroCTNColor = Color(0XFFdc3545);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController heightControler = TextEditingController();
  TextEditingController weightControler = TextEditingController();
  void refreshFields() {
    heightControler.text = '';
    weightControler.text = '';
    setState(() {
      hasHeightError = false;
      hasWeightError = false;
      imcText = 'Seu IMC aparecerá aqui!';
      imcHeightTextErros = '';
      imcWeightTextErros = '';
      graphicResult = 0.0001;
      graphicMiddleText = '0';
    });
  }
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.

  @override
  void calculate() {
    double height = double.parse(heightControler.text) / 100;

    double weight = double.parse(weightControler.text);

    double imcValue = weight / (height * height);

    if (imcValue < 18.4) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicResult = 0.1;
        String formateValue = imcValue.toStringAsFixed(2);
        graphicColor = kPrimaryColor;
        imcText = 'Abaixo do peso ideal IMC:$formateValue';
      });
    } else if (imcValue < 24.9) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicResult = 0.3;
        graphicColor = Color(0XFF198754);
        String formateValue = imcValue.toStringAsFixed(2);
        imcText = 'Peso ideal IMC:$formateValue';
      });
    } else if (imcValue < 29.9) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicResult = 0.5;
        graphicColor = Color(0XFF20c997);
        String formateValue = imcValue.toStringAsFixed(2);
        imcText = 'Acima do peso Ideal IMC:$formateValue';
      });
    } else if (imcValue < 34.9) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicResult = 0.7;
        graphicColor = Color(0XFFffc107);

        String formateValue = imcValue.toStringAsFixed(2);
        imcText = 'Obesidade I IMC:$formateValue';
      });
    } else if (imcValue < 39.9) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicColor = Color(0XFFfd7e14);
        graphicResult = 0.8;
        String formateValue = imcValue.toStringAsFixed(2);
        imcText = 'Obesidade II IMC:$formateValue';
      });
    } else if (imcValue > 40) {
      setState(() {
        graphicMiddleText = imcValue.toStringAsFixed(2);
        graphicColor = Color(0XFFdc3545);
        graphicResult = 0.95;
        String formateValue = imcValue.toStringAsFixed(2);
        imcText = 'Obesidade III IMC:$formateValue';
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        drawer: MyDrawer(),
        drawerScrimColor: kDarkColor.withOpacity(0.5),
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 80,
          titleSpacing: 0,
          title: Text(
            'Calculadora de IMC',
            style: kAppBarTitleTS,
          ),
          leadingWidth: 70,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: refreshFields,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: 50,
                    margin: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                    decoration: kDecorationCtn(10, 0.2, 3, 5, kLightColor),
                    child: Icon(Ionicons.refresh_outline),
                  ),
                ),
              ),
            )
          ],
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                width: 50,
                margin: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                decoration: kDecorationCtn(10, 0.2, 3, 5, kLightColor),
                child: Icon(Ionicons.menu_outline),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 1,
                ),
                Column(
                  children: [
                    Container(
                      child: MyCircularProgress(context),
                      width: size.width * 0.6,
                      height: size.width * 0.6,
                      decoration: kDecorationCtn(
                          size.width * 0.6, 0.2, 5, 15, kLightColor),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                      '$imcText $imcHeightTextErros $imcWeightTextErros',
                      textAlign: TextAlign.center,
                      style: kTitleTS,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Altura',
                                  style: kMegaTitleTS,
                                ),
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: 46,
                                  child: TextFormField(
                                    maxLength: 3,
                                    validator: (heightValue) {
                                      if (heightValue == null ||
                                          heightValue.isEmpty) {
                                        setState(() {
                                          hasHeightError = true;
                                          imcWeightTextErros =
                                              'Por favor preencha os campos';
                                          imcText = '';
                                        });
                                        return null;
                                      } else {
                                        setState(() {
                                          hasHeightError = false;
                                        });
                                      }
                                    },
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
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never),
                                  ),
                                )
                              ],
                            ),
                            decoration: kDecorationCtn(
                                20,
                                0.2,
                                5,
                                15,
                                hasHeightError
                                    ? erroCTNColor.withOpacity(0.4)
                                    : kLightColor))),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Expanded(
                        child: Container(
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
                              maxLength: 3,
                              validator: (weightValue) {
                                if (weightValue == null ||
                                    weightValue.isEmpty) {
                                  setState(() {
                                    hasWeightError = true;
                                    imcWeightTextErros =
                                        'Por favor preencha os campos!';
                                    imcText = '';
                                  });
                                } else {
                                  setState(() {
                                    hasWeightError = false;
                                  });
                                }
                              },
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never),
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      decoration: kDecorationCtn(
                          15,
                          0.2,
                          4,
                          10,
                          hasWeightError
                              ? erroCTNColor.withOpacity(0.4)
                              : kLightColor),
                    ))
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        calculate();
                        setState(() {
                          imcHeightTextErros = '';
                          imcWeightTextErros = '';
                        });
                      }
                    },
                    child: MyButton(context)),
              ],
            ),
          ),
        ));
  }
}
