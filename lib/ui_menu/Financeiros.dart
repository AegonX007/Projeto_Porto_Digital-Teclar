import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_splash_screen/ui_menu/2_Aprendizado.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Financeiros extends StatefulWidget {
  @override
  _FinanceirosState createState() => _FinanceirosState();
}

class _FinanceirosState extends State<Financeiros> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeCard = (sizeHeight - sizeTop) * 0.586;

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
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(205, 93, 30, 132),
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
            height: 153.h,
            width: 522.w,
            color: Color.fromARGB(255, 105, 36, 129),
            child: Column(
              children: [
                Container(
                  height: 140.h,
                  margin: EdgeInsets.only(top: 5.h, left: 5.h),
                  child: Image.asset(("images/logo_financeiro.jpeg")),
                ),
              ],
            ),
          ),
          Container(
            height: sizeCard,
            width: sizeWidth,
            color: Colors.white,
            padding: EdgeInsets.only(
              top: sizeCard * 0.08,
            ),
            child: Scrollbar(
              thickness: sizeWidth * 0.02,
              controller: _scrollController,
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(
                            "images/itau.png", "ITAÚ", 3, sizeWidth, sizeCard),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/rappi.png",
                            "BANCO DO BRASIL", 4, sizeWidth, sizeCard),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/99food.jfif",
                            "BRADESCO", 5, sizeWidth, sizeCard),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/james.png", "CAIXA",
                            null, sizeWidth, sizeCard),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/uber_eats.png",
                            "SANTANDER", null, sizeWidth, sizeCard),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            height: 10.h,
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
                  margin: EdgeInsets.only(left: 22.w, top: 12.h),
                  child: Container(
                    height: 62.h,
                    width: 130.w,
                    child: RaisedButton(
                      textColor: Colors.white,
                      splashColor: Color(0xfffab611),
                      color: Color.fromARGB(255, 93, 30, 132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.black)),
                      onPressed: () {
                        Navigator.pushNamed(context, "/Menu");
                      },
                      child: Text(
                        "VOLTAR",
                        style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          fontSize: 21.ssp,
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

  Widget buildRaiseButton(String imagem, String nome, int page,
      double sizeWidth, double sizeHeight) {
    return Row(
      children: [
        Container(
          height: sizeWidth * 0.15,
          width: sizeWidth * 0.15,
          margin: EdgeInsets.only(top: sizeHeight * 0.024),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagem)),
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: sizeHeight * 0.024),
            padding: EdgeInsets.only(left: sizeWidth * 0.02),
            height: sizeWidth * 0.15,
            child: RaisedButton(
                textColor: Colors.white,
                splashColor: Color(0xfffab611),
                color: Color.fromARGB(255, 93, 30, 132),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TelaAprendizado(
                            page: page,
                          )));
                },
                child: Text(
                  nome,
                  style: TextStyle(
                    fontFamily: 'Open Sans Extra Bold',
                    fontSize: (sizeWidth * 0.35) * 0.18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        )
      ],
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
