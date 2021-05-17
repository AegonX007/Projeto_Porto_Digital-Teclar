import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mercado_pago_mobile_checkout/mercado_pago_mobile_checkout.dart';

class SejaPremium extends StatefulWidget {
  @override
  _SejaPremiumState createState() => _SejaPremiumState();
}

class _SejaPremiumState extends State<SejaPremium> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeCard = (sizeHeight - sizeTop) * 0.574;

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
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: 170.h,
                  width: sizeWidth,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.transparent),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color.fromARGB(255, 105, 36, 129)),
                ),
                Container(
                  height: 173.h,
                  width: 522.w,
                  child: Column(
                    children: [
                      Container(
                        height: 160.h,
                        margin: EdgeInsets.only(top: 5.h, left: 5.h),
                        child: Image.asset(("images/premium.jpeg")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                              height: sizeCard,
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
                              margin: EdgeInsets.only(top: 10.h),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text:
                                        'Conheça as vantagens\nde ser um membro premium\n',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans Bold',
                                      color: Color.fromARGB(255, 105, 36, 129),
                                      fontSize: 21.ssp,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: 'da '),
                                      TextSpan(
                                          text: 'TECLAR',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 120.h),
                              child: buildVantagens("Vantagem 1"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 170.h),
                              child: buildVantagens("Vantagem 2"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 220.h),
                              child: buildVantagens("Vantagem 3"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 270.h),
                              child: buildVantagens("Vantagem 4"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 320.h),
                              child: buildVantagens("Vantagem 5"),
                            )
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
                  margin: EdgeInsets.only(left: 22.w, top: 14.h),
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
                        Navigator.pushNamed(context, "/Menu");
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
              Container(
                  margin: EdgeInsets.only(right: 22.w, top: 14.h),
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
                      onPressed: () async {
                        PaymentResult result =
                            await MercadoPagoMobileCheckout.startCheckout(
                                "TEST-8b7dde5f-d871-460a-b0a6-4b71893c54d7",
                                "677705713-da85e600-0358-4e22-b15b-35374589105c");
                        print(result.toString());
                      },
                      child: Text(
                        "ASSINAR",
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
