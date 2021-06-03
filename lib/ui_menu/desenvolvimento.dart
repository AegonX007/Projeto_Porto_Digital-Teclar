import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Desenvolvimento extends StatefulWidget {
  @override
  _DesenvolvimentoState createState() => _DesenvolvimentoState();
}

class _DesenvolvimentoState extends State<Desenvolvimento> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeBox = (sizeHeight - sizeTop) * 0.805;

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                          height: sizeBox,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black38),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              color: Colors.white),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 180.h, bottom: 30.h),
                                child: Center(
                                  child: Image.asset(
                                    "images/desenvolvimento.png",
                                    fit: BoxFit.contain,
                                    height: 150.h,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
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
                            Navigator.pop(context);
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
        ));
  }
}
