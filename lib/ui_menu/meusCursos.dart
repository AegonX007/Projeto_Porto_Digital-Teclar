import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_tutorial_facebook/TelaInicial_Facebook.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/TelaInicial_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_instagram/TelaInicial_Instagram.dart';
import 'package:material_splash_screen/ui_tutorial_uber/TelaInicial_Uber.dart';
import 'package:material_splash_screen/ui_tutorial_whatsapp/TelaInicial_Whatsapp.dart';

class MeusCursos extends StatefulWidget {
  @override
  _MeusCursosState createState() => _MeusCursosState();
}

class _MeusCursosState extends State<MeusCursos> {
  final _scrollController = ScrollController();

  void verificarTela(context, int cont) {
    if (cont == 1) {
      /*Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaIfood()));*/
    } else if (cont == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaFacebook()));
    } else if (cont == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaWhatsapp()));
    } else if (cont == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaUber()));
    } else if (cont == 5) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaInstagram()));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = (sizeHeight * 0.2848) - (sizeHeight * 0.14);
    var sizeCard2 = (sizeHeight * 0.5322);
    var sizeCard3 = (sizeHeight * 0.867) - (sizeHeight * 0.14);

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
            onPressed: () {},
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
                  margin: EdgeInsets.only(top: sizeCard * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: sizeCard * 0.500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: sizeWidth * 0.04),
                        height: 4,
                        width: sizeWidth * 0.13,
                        color: Colors.black,
                      ),
                      Text(
                        "MEUS CURSOS",
                        style: TextStyle(
                            fontFamily: 'Open Sans Extra Bold',
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontSize: sizeWidth * 0.08,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: sizeWidth * 0.04),
                        height: 4,
                        width: sizeWidth * 0.13,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: sizeCard2,
            width: sizeWidth,
            color: Colors.white,
            child: Scrollbar(
              isAlwaysShown: true,
              thickness: sizeWidth * 0.02,
              controller: _scrollController,
              child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: sizeWidth * 0.06, top: sizeCard2 * 0.07),
                            padding: EdgeInsets.only(
                                top: sizeCard2 * 0.01,
                                bottom: sizeCard2 * 0.01,
                                left: sizeWidth * 0.03,
                                right: sizeWidth * 0.03),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(
                                    80, 48, 48, 48), // set border width
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), // set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Color.fromARGB(80, 48, 48, 48),
                                      offset: Offset(1, 3))
                                ] // make rounded corner of border
                                ),
                            child: Text("EM ANDAMENTO",
                                style: TextStyle(
                                    fontFamily: 'Open Sans Extra Bold',
                                    color: Color.fromARGB(255, 28, 28, 28),
                                    fontSize: sizeWidth * 0.06)),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: sizeHeight * 0.02,
                            left: sizeWidth * 0.06,
                            right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/ifood.png", "IFOOD", 1,
                            sizeWidth, sizeCard3, "42%"),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: sizeHeight * 0.002,
                            left: sizeWidth * 0.06,
                            right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/facebook.png",
                            "FACEBOOK", 2, sizeWidth, sizeCard3, "17%"),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: sizeWidth * 0.06, top: sizeCard2 * 0.1),
                            padding: EdgeInsets.only(
                                top: sizeCard2 * 0.01,
                                bottom: sizeCard2 * 0.01,
                                left: sizeWidth * 0.03,
                                right: sizeWidth * 0.03),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(
                                    80, 48, 48, 48), // set border width
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), // set rounded corner radius
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Color.fromARGB(80, 48, 48, 48),
                                      offset: Offset(1, 3))
                                ] // make rounded corner of border
                                ),
                            child: Text("JÁ CONCLUÍDOS",
                                style: TextStyle(
                                    fontFamily: 'Open Sans Extra Bold',
                                    color: Color.fromARGB(255, 28, 28, 28),
                                    fontSize: sizeWidth * 0.06)),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: sizeHeight * 0.01,
                            left: sizeWidth * 0.06,
                            right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/whatsapp.png",
                            "WHATSAPP", 3, sizeWidth, sizeCard3, "✔️"),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: sizeHeight * 0.01,
                            left: sizeWidth * 0.06,
                            right: sizeWidth * 0.06),
                        child: buildRaiseButton("images/uber.png", "UBER", 4,
                            sizeWidth, sizeCard3, "✔️"),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            height: sizeCard2 * 0.09,
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
              Padding(
                  padding: EdgeInsets.only(
                      left: sizeWidth * 0.06, top: sizeHeight * 0.0165),
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
                        Navigator.of(context).pop();
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

  Widget buildRanking(context, String imagem, String pos, String firstName,
      String pontuacao, double sizeWidth, double sizeCard) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: sizeCard * 0.08,
              margin: EdgeInsets.only(
                  left: sizeWidth * 0.05, right: sizeWidth * 0.07),
              padding: EdgeInsets.only(left: sizeWidth * 0.02),
              color: Color.fromARGB(255, 93, 30, 132),
              child: Row(
                children: [
                  Text(
                    pos,
                    style: TextStyle(
                        fontFamily: 'Open Sans Extra Bold',
                        fontSize: sizeWidth * 0.06,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: sizeWidth * 0.23),
                    child: Text(
                      firstName,
                      style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          fontSize: sizeWidth * 0.06,
                          color: Color.fromARGB(255, 242, 178, 42)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: sizeCard * 0.08,
              margin: EdgeInsets.only(
                  left: sizeWidth * 0.05, right: sizeWidth * 0.07),
              padding: EdgeInsets.only(right: sizeWidth * 0.02),
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Text(
                pontuacao,
                style: TextStyle(
                  fontFamily: 'Open Sans Extra Bold',
                  fontSize: sizeWidth * 0.055,
                  color: Color.fromARGB(255, 48, 48, 48),
                ),
              ),
            )
          ],
        ),
        Container(
          height: sizeWidth * 0.15,
          width: sizeWidth * 0.23,
          margin:
              EdgeInsets.only(top: sizeCard * 0.008, left: sizeWidth * 0.13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: NetworkImage(imagem), fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }

  Widget buildRaiseButton(String imagem, String nome, int cont,
      double sizeWidth, double sizeHeight, String percentual) {
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
                  verificarTela(context, cont);
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
        ),
        Container(
          margin: EdgeInsets.only(left: sizeWidth * 0.024),
          child: Text(
            percentual,
            style: TextStyle(
              fontFamily: 'Open Sans Extra Bold',
              fontSize: (sizeWidth * 0.35) * 0.18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
