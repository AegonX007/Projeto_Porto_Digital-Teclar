import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_menu/gridDashboard.dart';

class MenuGrid extends StatefulWidget {
  @override
  _MenuGridState createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = (sizeHeight * 0.2548) - (sizeHeight * 0.14);
    var sizeCard2 = (sizeHeight * 0.5622);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(sizeHeight * 0.08),
        child: AppBar(
          elevation: 6,
          backgroundColor: Color.fromARGB(255, 93, 30, 132),
          title: Text(
            "MENU",
            style:
                TextStyle(fontFamily: 'Open Sans', fontSize: sizeWidth * 0.08),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            iconSize: sizeWidth * 0.10,
            splashColor: Color(0xfffab611),
            onPressed: () {
              Navigator.pushNamed(context, "/Gaveta");
            },
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(30)),
                  color: Colors.white),
              margin: EdgeInsets.only(
                  right: sizeWidth * 0.03,
                  top: sizeHeight * 0.008,
                  bottom: sizeHeight * 0.005),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Menu");
                },
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 93, 30, 132),
                  size: sizeWidth * 0.11,
                ),
                splashColor: Color(0xfffab611),
                padding: EdgeInsets.only(right: sizeWidth * 0.00001),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 242, 178, 42),
      body: Column(
        children: [
          Container(
            height: sizeCard,
            width: sizeWidth,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: sizeCard * 0.005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: sizeHeight * 0.01,
                      left: sizeWidth * 0.01,
                      right: sizeWidth * 0.01),
                  child: Text(
                    "Qual tipo de APP você",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Open Sans Extra Bold',
                        color: Color.fromARGB(255, 48, 48, 48),
                        fontSize: sizeCard * 0.33,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "deseja aprender hoje?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Open Sans Extra Bold',
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: sizeCard * 0.33,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: sizeCard2 * 1.09,
            width: sizeWidth,
            padding: EdgeInsets.only(top: sizeCard * 0.30),
            color: Colors.white,
            child: Scrollbar(
                isAlwaysShown: true,
                thickness: sizeWidth * 0.02,
                controller: _scrollController,
                child: GridDash()),
          ),
          Container(
            height: sizeCard2 * 0.098,
            width: sizeWidth,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.transparent),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.white),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: sizeWidth * 0.06, top: sizeHeight * 0.0145),
                  child: Container(
                    height: sizeHeight * 0.082,
                    width: sizeWidth * 0.4,
                    child: RaisedButton(
                      textColor: Colors.white,
                      splashColor: Color(0xfffab611),
                      color: Color.fromARGB(255, 93, 30, 132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => janelaPopUp(sizeWidth, sizeHeight));
                      },
                      child: Text(
                        "VOLTAR",
                        style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          fontSize: (sizeWidth * 0.35) * 0.18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  AlertDialog janelaPopUp(double sizeWidth, double sizeHeight) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 24,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black)),
      title: Text(
        "Aviso!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 93, 30, 132),
          fontFamily: 'Open Sans Extra Bold',
          fontSize: sizeWidth * 0.09,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Você tem certeza que deseja sair da sua conta?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 48, 48, 48),
          fontFamily: 'Open Sans Extra Bold',
          fontSize: sizeWidth * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Row(
          children: [
            Container(
              height: sizeHeight * 0.062,
              width: sizeWidth * 0.28,
              margin: EdgeInsets.only(
                  right: sizeWidth * 0.11, bottom: sizeHeight * 0.01),
              child: RaisedButton(
                splashColor: Color(0xfffab611),
                color: Color.fromARGB(255, 93, 30, 132),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Não",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans Extra Bold',
                    fontSize: sizeWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: sizeHeight * 0.062,
              width: sizeWidth * 0.28,
              margin: EdgeInsets.only(
                  right: sizeWidth * 0.04, bottom: sizeHeight * 0.01),
              child: RaisedButton(
                color: Color.fromARGB(255, 93, 30, 132),
                splashColor: Color(0xfffab611),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  auth.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/Home', (Route<dynamic> route) => false);
                },
                child: Text(
                  "Sim",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans Extra Bold',
                    fontSize: sizeWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
