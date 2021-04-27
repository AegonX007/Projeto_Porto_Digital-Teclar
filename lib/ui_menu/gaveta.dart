import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_splash_screen/entity/usuario.dart';
import 'package:material_splash_screen/ui_menu/meusCursos.dart';
import 'package:material_splash_screen/ui_menu/ranking.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GavetaMenu extends StatefulWidget {
  @override
  _GavetaMenuState createState() => _GavetaMenuState();
}

class _GavetaMenuState extends State<GavetaMenu> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;
  final _controller = StreamController<QuerySnapshot>.broadcast();
  String usuarioAtual;

  Stream<QuerySnapshot> _adicionarDados() {
    Firestore db = Firestore.instance;
    final stream = db
        .collection("usuarios")
        .orderBy("pontuacao", descending: true)
        .snapshots();

    stream.listen((dados) {
      _controller.add(dados);
    });
  }

  String firstName(String n) {
    var sp = n.split(" ");

    if (sp[0].length >= 10) {
      var repart = sp[0].substring(0, 10);
      var repart2 = sp[0].substring(10, sp[0].length);
      return repart + "-" + "\n" + repart2;
    } else {
      return sp[0];
    }
  }

  _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    usuarioAtual = usuarioLogado.email;

    _adicionarDados();
  }

  Future<String> usuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    return usuarioLogado.email;
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = (sizeHeight * 0.867) - (sizeHeight * 0.105);

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
            onPressed: () {},
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
          SingleChildScrollView(
            child: Container(
              height: 570.h,
              width: sizeWidth,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: Colors.black38),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: _controller.stream,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Container(
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Carregando Dados",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        color: Color.fromARGB(255, 48, 48, 48),
                                        fontStyle: FontStyle.italic,
                                        fontSize: 25.ssp,
                                      ),
                                    ),
                                    CircularProgressIndicator()
                                  ],
                                ),
                              ),
                            );
                            break;
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text("Erro ao carregar os dados!");
                            } else {
                              QuerySnapshot querySnapshot = snapshot.data;

                              if (querySnapshot.documents.length == 0) {
                                return Center(
                                  child: Text(
                                    "Sem Usuários!",
                                    style: TextStyle(
                                        fontSize: 18.ssp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: querySnapshot.documents.length,
                                  itemBuilder: (context, indice) {
                                    List<DocumentSnapshot> usuarios =
                                        querySnapshot.documents.toList();
                                    DocumentSnapshot item = usuarios[indice];
                                    String email = item["email"];
                                    String nome = item["nome"];
                                    String senha = item["senha"];
                                    String urlImagem = item["urlImagemPerfil"];
                                    int pontuacao = item["pontuacao"];

                                    Usuario usuario = new Usuario(false, email,
                                        nome, pontuacao, senha, urlImagem);

                                    if (usuario.email == usuarioAtual) {
                                      return Row(
                                        children: [
                                          Container(
                                            height: 100.h,
                                            width: 100.w,
                                            margin: EdgeInsets.only(
                                                top: 18.h, left: 20.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2.w,
                                                  color: Color.fromARGB(
                                                      255, 93, 30, 132)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      usuario.urlImagemPerfil),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 30.h, left: 15.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10.w),
                                                  child: Text(
                                                    "Olá, " +
                                                        firstName(
                                                            usuario.nome) +
                                                        "!",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Open Sans Extra Bold',
                                                        color: Color.fromARGB(
                                                            255, 48, 48, 48),
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 22.ssp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Container(
                                                  height: 48.h,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          "/MeuPerfil");
                                                    },
                                                    color: Color.fromARGB(
                                                        255, 242, 178, 42),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Text(
                                                      "VER MEU PERFIL",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans Extra Bold',
                                                          color: Color.fromARGB(
                                                              255, 93, 30, 132),
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 21.ssp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    } else {
                                      return Container();
                                    }
                                  });
                            }
                        }
                      }),
                  Container(
                    margin: EdgeInsets.only(top: 25.h),
                    height: 3.h,
                    width: sizeWidth * 0.87,
                    color: Color.fromARGB(50, 48, 48, 48),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: FlatButton(
                      splashColor: Color(0xfffab611),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MeusCursos()));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 70.h,
                            width: 100.w,
                            margin: EdgeInsets.only(),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("images/MeusCursos.png"))),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.w),
                            height: 45.h,
                            alignment: Alignment.center,
                            child: Text(
                              "Meus Cursos",
                              style: TextStyle(
                                color: Color.fromARGB(255, 48, 48, 48),
                                fontFamily: 'Open Sans Extra Bold',
                                fontSize: 30.ssp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: FlatButton(
                      splashColor: Color(0xfffab611),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Ranking()));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 70.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/ranking.png"))),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.w),
                            height: 45.h,
                            alignment: Alignment.center,
                            child: Text(
                              "Ranking",
                              style: TextStyle(
                                color: Color.fromARGB(255, 48, 48, 48),
                                fontFamily: 'Open Sans Extra Bold',
                                fontSize: 30.ssp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    height: 3.h,
                    width: sizeWidth * 0.87,
                    color: Color.fromARGB(50, 48, 48, 48),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: FlatButton(
                      splashColor: Color(0xfffab611),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => janelaPopUp(sizeWidth, sizeHeight));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 70.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/sair.png"))),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.w),
                            height: 45.h,
                            alignment: Alignment.center,
                            child: Text(
                              "Sair do APP",
                              style: TextStyle(
                                color: Color.fromARGB(255, 48, 48, 48),
                                fontFamily: 'Open Sans Extra Bold',
                                fontSize: 30.ssp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15.w, top: 13.h),
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
                        Navigator.of(context).pop();
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
        "Você tem certeza que deseja sair do APP?",
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
                  SystemNavigator.pop();
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
