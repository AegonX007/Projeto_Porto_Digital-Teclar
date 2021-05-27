import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/entity/usuario.dart';
import 'package:material_splash_screen/ui_tutorial_facebook/TelaInicial_Facebook.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/TelaInicial_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_instagram/TelaInicial_Instagram.dart';
import 'package:material_splash_screen/ui_tutorial_uber/TelaInicial_Uber.dart';
import 'package:material_splash_screen/ui_tutorial_whatsapp/TelaInicial_Whatsapp.dart';

class TelaNiveis extends StatefulWidget {
  int page;
  TelaNiveis(int page) {
    this.page = page;
  }
  @override
  _TelaNiveisState createState() => _TelaNiveisState(page);
}

class _TelaNiveisState extends State<TelaNiveis> {
  int page;
  bool premium;
  _TelaNiveisState(int page) {
    this.page = page;
  }

  void verificarTela(context, String nome, int nomeTipo) {
    print("SEILAAAAAAAAAAAAAAAAAAAAAAAAA");
    if (page == 1) {
      print("SEI JNAOOOOOOOOOOOOOOOOOOOOO");
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaIfood(tipo: nome, nome: nomeTipo)));
    } else if (page == 2) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaUber(tipo: nome, nome: nomeTipo)));
    } else if (page == 3) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaWhatsapp(tipo: nome, nome: nomeTipo)));
    } else if (page == 4) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaFacebook(tipo: nome, nome: nomeTipo)));
    } else if (page == 5) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TelaInstagram(tipo: nome, nome: nomeTipo)));
    } else {
      return null;
    }
  }

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
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: sizeHeight * 0.05, bottom: sizeHeight * 0.02),
                  child: Center(
                    child: Text(
                      "Qual nível deseja aprender?",
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
                        child: buildButton(
                            context,
                            "images/basico_estrelas.png",
                            "BÁSICO",
                            "IFOOD",
                            1,
                            sizeWidth,
                            sizeCard,
                            premium),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                          child: (premium)
                              ? buildButton2(
                                  context,
                                  "images/diamante_premium.png",
                                  "MÉDIO",
                                  2,
                                  sizeWidth,
                                  sizeCard,
                                  premium)
                              : buildButton2(
                                  context,
                                  "images/diamante_premium.png",
                                  "MÉDIO",
                                  2,
                                  sizeWidth,
                                  sizeCard,
                                  premium)),
                      Container(
                          margin: EdgeInsets.only(
                              left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                          child: (premium)
                              ? buildButton2(
                                  context,
                                  "images/diamante_premium.png",
                                  "AVANÇADO",
                                  3,
                                  sizeWidth,
                                  sizeCard,
                                  premium)
                              : buildButton2(
                                  context,
                                  "images/diamante_premium.png",
                                  "AVANÇADO",
                                  3,
                                  sizeWidth,
                                  sizeCard,
                                  premium)),
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

  Widget buildButton(context, String imagem, String nome, String nomeCurso,
      int nomeTipo, double sizeWidth, double sizeHeight, bool premium) {
    return Row(
      children: [
        Container(
          height: sizeWidth * 0.17,
          width: sizeWidth * 0.18,
          margin: EdgeInsets.only(top: sizeHeight * 0.05),
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(imagem))),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: sizeHeight * 0.05),
            padding: EdgeInsets.only(left: sizeWidth * 0.02),
            height: sizeWidth * 0.18,
            child: RaisedButton(
                textColor: Colors.white,
                splashColor: Color(0xfffab611),
                color: Color.fromARGB(255, 93, 30, 132),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  verificarTela(context, nomeCurso, nomeTipo);
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

  Widget buildButton2(context, String imagem, String nome, int nomeTipo,
      double sizeWidth, double sizeHeight, bool premium) {
    if (premium == true) {
      return Row(
        children: [
          Container(
            height: sizeWidth * 0.17,
            width: sizeWidth * 0.18,
            margin: EdgeInsets.only(top: sizeHeight * 0.05),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagem))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.05),
              padding: EdgeInsets.only(left: sizeWidth * 0.02),
              height: sizeWidth * 0.18,
              child: RaisedButton(
                  textColor: Colors.white,
                  splashColor: Color(0xfffab611),
                  color: Color.fromARGB(255, 93, 30, 132),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    verificarTela(context, nome, nomeTipo);
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
    } else {
      return Row(
        children: [
          Container(
            height: sizeWidth * 0.17,
            width: sizeWidth * 0.18,
            margin: EdgeInsets.only(top: sizeHeight * 0.05),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagem))),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.05),
              padding: EdgeInsets.only(left: sizeWidth * 0.02),
              height: sizeWidth * 0.18,
              child: RaisedButton.icon(
                  textColor: Colors.white,
                  color: Colors.purple[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  icon: Icon(Icons.lock),
                  label: Text(
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
  }
}
