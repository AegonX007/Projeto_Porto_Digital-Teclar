import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_menu/AprendizadoFarmacia.dart';

class OpcoesFarmacia extends StatefulWidget {
  @override
  _OpcoesFarmaciaState createState() => _OpcoesFarmaciaState();
}

class _OpcoesFarmaciaState extends State<OpcoesFarmacia> {
  bool premium;

  _recuperarPremium() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioAtual = await auth.currentUser();
    Firestore db = Firestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("usuarios")
        .where("email", isEqualTo: usuarioAtual.email)
        .getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
      premium = dados["premium"];

      setState(() {
        premium = dados["premium"];
        print(premium);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _recuperarPremium();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = (sizeHeight * 0.867) - (sizeHeight * 0.105);
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
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black38),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.grey[100]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: sizeHeight * 0.05, bottom: sizeHeight * 0.02),
                  child: Center(
                    child: Text(
                      "Conteúdos exclusivos\npara saber mais sobre:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontStyle: FontStyle.italic,
                          fontSize: sizeWidth * 0.075,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: sizeCard * 0.02),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                        child: Row(
                          children: [
                            Container(
                              height: sizeWidth * 0.17,
                              width: sizeWidth * 0.18,
                              margin: EdgeInsets.only(top: sizeHeight * 0.05),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/bemEstar.jpeg"))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: sizeHeight * 0.05),
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.02),
                                height: sizeWidth * 0.18,
                                child: RaisedButton(
                                    textColor: Colors.white,
                                    splashColor: Color(0xfffab611),
                                    color: Color.fromARGB(255, 93, 30, 132),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.black)),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TelaAprendizadoFarmacia()));
                                    },
                                    child: Text(
                                      "BEM-ESTAR",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        fontSize: (sizeWidth * 0.35) * 0.18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                        child: Row(
                          children: [
                            Container(
                              height: sizeWidth * 0.17,
                              width: sizeWidth * 0.18,
                              margin: EdgeInsets.only(top: sizeHeight * 0.05),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/saude.jpeg"))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: sizeHeight * 0.05),
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.02),
                                height: sizeWidth * 0.18,
                                child: RaisedButton(
                                    textColor: Colors.white,
                                    splashColor: Color(0xfffab611),
                                    color: Color.fromARGB(255, 93, 30, 132),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.black)),
                                    onPressed: () {
                                      TelaAprendizadoFarmacia();
                                    },
                                    child: Text(
                                      "SAÚDE & EXAMES",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        fontSize: (sizeWidth * 0.35) * 0.18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                        child: Row(
                          children: [
                            Container(
                              height: sizeWidth * 0.17,
                              width: sizeWidth * 0.18,
                              margin: EdgeInsets.only(top: sizeHeight * 0.05),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/atvFisica.jpeg"))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: sizeHeight * 0.05),
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.02),
                                height: sizeWidth * 0.18,
                                child: RaisedButton(
                                    textColor: Colors.white,
                                    splashColor: Color(0xfffab611),
                                    color: Color.fromARGB(255, 93, 30, 132),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.black)),
                                    onPressed: () {
                                      TelaAprendizadoFarmacia();
                                    },
                                    child: Text(
                                      "ATIVIDADE FÍSICA",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        fontSize: (sizeWidth * 0.35) * 0.18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                        child: Row(
                          children: [
                            Container(
                              height: sizeWidth * 0.17,
                              width: sizeWidth * 0.18,
                              margin: EdgeInsets.only(top: sizeHeight * 0.05),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/alimentação.jpeg"))),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: sizeHeight * 0.05),
                                padding:
                                    EdgeInsets.only(left: sizeWidth * 0.02),
                                height: sizeWidth * 0.18,
                                child: RaisedButton(
                                    textColor: Colors.white,
                                    splashColor: Color(0xfffab611),
                                    color: Color.fromARGB(255, 93, 30, 132),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.black)),
                                    onPressed: () {
                                      TelaAprendizadoFarmacia();
                                    },
                                    child: Text(
                                      "ALIMENTAÇÃO",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        fontSize: (sizeWidth * 0.35) * 0.18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
}
