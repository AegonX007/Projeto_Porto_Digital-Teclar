import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';

class PagamentoAprovado extends StatefulWidget {
  @override
  _PagamentoAprovadoState createState() => _PagamentoAprovadoState();
}

class _PagamentoAprovadoState extends State<PagamentoAprovado> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeCard = (sizeHeight - sizeTop) * 0.572;

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
            child: Column(
              children: [
                Scrollbar(
                  thickness: sizeWidth * 0.02,
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: sizeCard * 1.4,
                              width: sizeWidth,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.transparent),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 15.h),
                                child: Image.asset(
                                    "images/premium_pagamento.jpg")),
                            Container(
                              margin: EdgeInsets.only(top: 420.h),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'PARABÉNS!',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans Bold',
                                        color: Colors.black,
                                        fontSize: 21.ssp,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 470.h, left: 170.w),
                              color: Color.fromARGB(255, 105, 36, 129),
                              height: 3.h,
                              width: 40.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 490.h),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Agora você é um\n membro PREMIUM!!',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans Bold',
                                        color: Colors.black,
                                        fontSize: 21.ssp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 230.w, top: 12.h),
                  child: Container(
                    height: 62.h,
                    width: 140.w,
                    child: RaisedButton(
                      textColor: Colors.white,
                      splashColor: Color(0xfffab611),
                      color: Color.fromARGB(255, 93, 30, 132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 93, 30, 132))),
                      onPressed: () async {
                        Navigator.pushNamed(context, "/Menu");
                      },
                      child: Text(
                        "AVANÇAR",
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

  Widget buildVantagens(String vantagem) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Colors.amber,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text(
                vantagem,
                style: TextStyle(
                  fontFamily: 'Open Sans Bold',
                  color: Color.fromARGB(255, 105, 36, 129),
                  fontSize: 18.ssp,
                ),
              ))
        ],
      ),
    );
  }
}
