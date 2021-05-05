import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_menu/gridDashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeBox = (sizeHeight - sizeTop) * 0.65;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          elevation: 6,
          backgroundColor: Color.fromARGB(255, 93, 30, 132),
          title: Text(
            "MENU",
            style: TextStyle(fontFamily: 'Open Sans', fontSize: 25.ssp),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            iconSize: 40.h,
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
              margin: EdgeInsets.only(right: 15.w, top: 4.h, bottom: 3.h),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Menu");
                },
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 93, 30, 132),
                  size: 45.ssp,
                ),
                splashColor: Color(0xfffab611),
                padding: EdgeInsets.only(right: 1.w),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 242, 178, 42),
      body: Column(
        children: [
          Container(
            height: 90.h,
            width: sizeWidth,
            color: Colors.grey[350],
            child: Container(
              margin: EdgeInsets.only(top: 15.h, left: 7.w, right: 7.w),
              child: Text(
                "Qual tipo de APP você deseja aprender hoje?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Open Sans Extra Bold',
                    color: Color.fromARGB(255, 48, 48, 48),
                    fontSize: 25.ssp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: sizeBox,
            width: sizeWidth,
            padding: EdgeInsets.only(top: 5.h),
            color: Colors.grey[350],
            child: Scrollbar(
                isAlwaysShown: true,
                thickness: 7.w,
                controller: _scrollController,
                child: GridDash()),
          ),
          Container(
            height: 25.h,
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
                  margin: EdgeInsets.only(left: 15.w, top: 12.h),
                  child: Container(
                    height: 62.h,
                    width: 150.w,
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
                          fontSize: 23.ssp,
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
