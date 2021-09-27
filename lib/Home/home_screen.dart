import 'dart:ffi';
import 'dart:ui';

import 'package:calculador_de_iimc/components.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

String imcText = '';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void refreshFields() {
    imcText = '';
    heightControler.text = '';
    weightControler.text = '';
    setState(() {
      imcValue = 0;
      graphicResult = 0;
    });
  }
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.

  @override
  void showInGraphic() {
    setState(() {
      imcGraphicShow = imcValue / 100;
    });
  }

  void calculate() {
    double height = double.parse(heightControler.text);
    double weight = double.parse(weightControler.text);
    imcValue = (height * height) / weight;
    if (imcValue < 40) {
      setState(() {
        imcText = 'Abaixo do peso';
      });
      return print(imcText);
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 0,
      ),
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
                  decoration: BoxDecoration(
                      color: kLightColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: kDarkColor.withOpacity(0.2),
                            offset: Offset(3, 3),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3, -3),
                            blurRadius: 5)
                      ]),
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
              decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: kDarkColor.withOpacity(0.2),
                        offset: Offset(3, 3),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -3),
                        blurRadius: 5)
                  ]),
              child: Icon(Ionicons.menu_outline),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.width * 1,
            ),
            Container(
              child: MyCircularProgress(context),
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                  color: kLightColor,
                  borderRadius: BorderRadius.circular(size.width * 0.6),
                  boxShadow: [
                    BoxShadow(
                        color: kDarkColor.withOpacity(0.2),
                        offset: Offset(5, 5),
                        blurRadius: 15),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 15)
                  ]),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              children: [
                Expanded(child: HeightField()),
                Padding(padding: EdgeInsets.only(left: 15)),
                Expanded(child: WeightField())
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            InkWell(
                onTap: () {
                  calculate();
                },
                child: MyButton(context)),
          ],
        ),
      ),
    );
  }
}
