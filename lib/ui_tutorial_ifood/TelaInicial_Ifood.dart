import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/entity/curso.dart';
import 'package:material_splash_screen/entity/usuario.dart';
import 'package:material_splash_screen/ui_menu/1_Menu.dart';
import 'package:material_splash_screen/ui_menu/2_Aprendizado.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_audio/BaixarApp_Audio_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_texto/BaixarAppTexto/1_BaixarApp_Texto_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_texto/BaixarAppTexto/2_EntrarApp_Texto_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_video/BaixarApp_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_video/CadastrarApp_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_video/EntrarApp_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_video/LoginApp_Ifood.dart';
import 'package:material_splash_screen/ui_tutorial_ifood/ui_video/PedirApp_Ifood.dart';

class TelaIfood extends StatelessWidget {
  final String tipo;
  final int nome;

  const TelaIfood({Key key, this.tipo, this.nome}) : super(key: key);

  bool testeCor(String text) {
    if (tipo == text) {
      return true;
    } else {
      return false;
    }
  }

  String verificarIcone() {
    if (tipo == "ASSISTINDO") {
      return "images/movie.png";
    } else if (tipo == "OUVINDO") {
      return "images/audio.png";
    } else {
      return "images/book.png";
    }
  }

  void verificarTela(context, String nome, String tipo, int cont) {
    if (cont == 1) {
      if (tipo == "ASSISTINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BaixarAPP_Video_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      } else if (tipo == "OUVINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BaixarAPP_Audio_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      } else {
        _alterandoPontuacaoTexto(nome);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BaixarApp_Texto_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      }
    } else if (cont == 2) {
      if (tipo == "ASSISTINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EntrarAPP_Video_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      } else if (tipo == "OUVINDO") {
        // TODO
      } else {
        _alterandoPontuacaoTexto(nome);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EntrarApp_Texto_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      }
    } else if (cont == 3) {
      if (tipo == "ASSISTINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CadastrarAPP_Video_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      }
    } else if (cont == 4) {
      if (tipo == "ASSISTINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginAPP_Video_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      }
    } else if (cont == 5) {
      if (tipo == "ASSISTINDO") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PedirAPP_Video_Ifood(
                  cont,
                  nome,
                  "https://www.youtube.com/watch?v=90Ur7UO318I",
                )));
      }
    } else {
      return null;
    }
  }

  void _alterandoPontuacaoTexto(String nome) async {
    Usuario usuario = await _recuperarDados();
    Curso curso = await _recuperarCurso(usuario, nome);

    Map<String, dynamic> toMap() {
      if (curso == null) {
        Map<String, dynamic> map = {
          "cpf": usuario.cpf,
          "pontuacao": 20,
          "audio": false,
          "texto": true,
          "video": true
        };
        return map;
      } else {
        Map<String, dynamic> map = {
          "cpf": usuario.cpf,
          "pontuacao": 20,
          "audio": curso.audio,
          "texto": true,
          "video": curso.video
        };
        return map;
      }
    }

    salvar() async {
      Firestore db = Firestore.instance;
      await db
          .collection("cursos")
          .document("Ifood" + "_" + nome + "_" + usuario.cpf)
          .setData(toMap());
    }

    salvar();
    int total = await totalPontos(usuario);
    updateDados(total);
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = (sizeHeight * 0.3148) - (sizeHeight * 0.14);
    var sizeCard2 = (sizeHeight * 0.5022);
    final _scrollController = ScrollController();

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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MenuInicial()));
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
                    children: [
                      Container(
                        child: Text(
                          "ASSISTIR",
                          style: TextStyle(
                            fontFamily: testeCor("ASSISTINDO")
                                ? 'Open Sans Extra Bold'
                                : 'Open Sans',
                            fontSize: sizeWidth * 0.07,
                            color: testeCor("ASSISTINDO")
                                ? Color.fromARGB(255, 48, 48, 48)
                                : Color.fromARGB(170, 48, 48, 48),
                            decoration: TextDecoration.underline,
                            decorationColor: testeCor("ASSISTINDO")
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: sizeWidth * 0.032,
                          right: sizeWidth * 0.032,
                          bottom: sizeCard * 0.1,
                        ),
                        child: Text(
                          ".",
                          style: TextStyle(
                              color: Color(0xfffab611),
                              fontFamily: 'Open Sans',
                              fontSize: sizeWidth * 0.1),
                        ),
                      ),
                      Container(
                        child: Text(
                          "OUVIR",
                          style: TextStyle(
                            fontFamily: testeCor("OUVINDO")
                                ? 'Open Sans Extra Bold'
                                : 'Open Sans',
                            fontSize: sizeWidth * 0.07,
                            color: testeCor("OUVINDO")
                                ? Color.fromARGB(255, 48, 48, 48)
                                : Color.fromARGB(170, 48, 48, 48),
                            decoration: TextDecoration.underline,
                            decorationColor: testeCor("OUVINDO")
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: sizeWidth * 0.032,
                          right: sizeWidth * 0.032,
                          bottom: sizeCard * 0.1,
                        ),
                        child: Text(
                          ".",
                          style: TextStyle(
                              color: Color(0xfffab611),
                              fontFamily: 'Open Sans',
                              fontSize: sizeWidth * 0.1),
                        ),
                      ),
                      Container(
                        child: Text(
                          "LER",
                          style: TextStyle(
                            fontFamily: testeCor("LENDO")
                                ? 'Open Sans Extra Bold'
                                : 'Open Sans',
                            fontSize: sizeWidth * 0.07,
                            color: testeCor("LENDO")
                                ? Color.fromARGB(255, 48, 48, 48)
                                : Color.fromARGB(170, 48, 48, 48),
                            decoration: TextDecoration.underline,
                            decorationColor:
                                testeCor("LENDO") ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: sizeWidth * 0.04),
                        height: 4,
                        width: sizeWidth * 0.2,
                        color: Colors.black,
                      ),
                      Text(
                        "IFOOD",
                        style: TextStyle(
                            fontFamily: 'Open Sans Extra Bold',
                            color: Color.fromARGB(255, 93, 30, 132),
                            fontStyle: FontStyle.italic,
                            fontSize: sizeWidth * 0.1,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: sizeWidth * 0.04),
                        height: 4,
                        width: sizeWidth * 0.2,
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
                child: Container(
                    margin: EdgeInsets.only(top: sizeCard2 * 0.03),
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(context, 1, verificarIcone(),
                            "BAIXAR APP", sizeWidth, sizeCard2),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(context, 2, verificarIcone(),
                            "ENTRAR APP", sizeWidth, sizeCard2),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(context, 3, verificarIcone(),
                            "CADASTRO", sizeWidth, sizeCard2),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(context, 4, verificarIcone(),
                            "LOGIN", sizeWidth, sizeCard2),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: sizeWidth * 0.06, right: sizeWidth * 0.06),
                        child: buildRaiseButton(context, 5, verificarIcone(),
                            "PEDIR ALGO", sizeWidth, sizeCard2),
                      ),
                    ])),
              ),
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
              Container(
                  margin: EdgeInsets.only(
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
                        Navigator.of(context).pop(MaterialPageRoute(
                            builder: (context) => TelaAprendizado()));
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

  Widget buildRaiseButton(context, int cont, String imagem, String nome,
      double sizeWidth, double sizeHeight) {
    return Row(
      children: [
        Container(
            height: sizeWidth * 0.15,
            width: sizeWidth * 0.15,
            margin: EdgeInsets.only(top: sizeHeight * 0.024),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagem)),
            )),
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
                  if (imagem == "images/movie.png") {
                    verificarTela(context, nome, "ASSISTINDO", cont);
                  } else if (imagem == "images/audio.png") {
                    verificarTela(context, nome, "OUVINDO", cont);
                  } else {
                    verificarTela(context, nome, "LENDO", cont);
                  }
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

  // ! --------------------------------------------------------------------------------
  // ! --------------------------------------------------------------------------------
  // ! --------------------------------------------------------------------------------

  // ? Capturando todos os dados necessarios para aumentar a pontuação
  // ? do tutorial texto assim que ele pressionar o botão lendo

  Future<Usuario> _recuperarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioAtual = await auth.currentUser();
    Firestore db = Firestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("usuarios")
        .where("email", isEqualTo: usuarioAtual.email)
        .getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      Usuario usuario = new Usuario(false, dados["cpf"], dados["email"],
          dados["nome"], 0, dados["senha"], dados["urlImagemPerfil"]);
      return usuario;
    }
  }

  Future<Curso> _recuperarCurso(Usuario usuario, String nome) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioAtual = await auth.currentUser();
    Firestore db = Firestore.instance;

    DocumentSnapshot snapshot = await db
        .collection("cursos")
        .document("Ifood" + "_" + nome + "_" + usuario.cpf)
        .get();
    var dados = snapshot.data;
    if (dados != null) {
      Curso curso = new Curso(dados["cpf"], dados["pontuacao"], dados["audio"],
          dados["video"], dados["texto"]);
      return curso;
    } else {
      return null;
    }
  }

  Future<int> totalPontos(Usuario usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioAtual = await auth.currentUser();
    Firestore db = Firestore.instance;
    int soma = 0;

    QuerySnapshot querySnapshot = await db
        .collection("cursos")
        .where("cpf", isEqualTo: usuario.cpf)
        .getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      soma += dados["pontuacao"];
    }
    return soma;
  }

  void updateDados(int pontuacao) async {
    Usuario usuario = await _recuperarDados();
    Map<String, dynamic> dadosAtualizar = {"pontuacao": pontuacao};
    Firestore db = Firestore.instance;
    db.collection("usuarios").document(usuario.cpf).updateData(dadosAtualizar);
  }
}

// ? - Tornar as palavras ASSISTIR, OUVIR E LER BOTÕES

/*
FlatButton(
                        onPressed: () {
                          Future.delayed(Duration(milliseconds: 200)).then((_) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TelaIfood(tipo: "ASSISTINDO", nome: nome)));
                          });
                        },
                        child: Container(
                          child: Text(
                            "ASSISTIR",
                            style: TextStyle(
                              fontFamily: testeCor("ASSISTINDO")
                                  ? 'Open Sans Extra Bold'
                                  : 'Open Sans',
                              fontSize: sizeWidth * 0.06,
                              color: testeCor("ASSISTINDO")
                                  ? Color.fromARGB(255, 48, 48, 48)
                                  : Color.fromARGB(170, 48, 48, 48),
                              decoration: TextDecoration.underline,
                              decorationColor: testeCor("ASSISTINDO")
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: sizeWidth * 0.025,
                          right: sizeWidth * 0.025,
                          bottom: sizeCard * 0.03,
                        ),
                        child: Text(
                          ".",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: sizeWidth * 0.08),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Future.delayed(Duration(milliseconds: 200)).then((_) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TelaIfood(tipo: "OUVINDO", nome: nome)));
                          });
                        },
                        child: Container(
                          child: Text(
                            "OUVIR",
                            style: TextStyle(
                              fontFamily: testeCor("OUVINDO")
                                  ? 'Open Sans Extra Bold'
                                  : 'Open Sans',
                              fontSize: sizeWidth * 0.06,
                              color: testeCor("OUVINDO")
                                  ? Color.fromARGB(255, 48, 48, 48)
                                  : Color.fromARGB(170, 48, 48, 48),
                              decoration: TextDecoration.underline,
                              decorationColor: testeCor("OUVINDO")
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: sizeWidth * 0.025,
                          right: sizeWidth * 0.025,
                          bottom: sizeCard * 0.03,
                        ),
                        child: Text(
                          ".",
                          style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: sizeWidth * 0.08),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Future.delayed(Duration(milliseconds: 200)).then((_) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TelaIfood(tipo: "LENDO", nome: nome)));
                          });
                        },
                        child: Container(
                          child: Text(
                            "LER",
                            style: TextStyle(
                              fontFamily: testeCor("LENDO")
                                  ? 'Open Sans Extra Bold'
                                  : 'Open Sans',
                              fontSize: sizeWidth * 0.06,
                              color: testeCor("LENDO")
                                  ? Color.fromARGB(255, 48, 48, 48)
                                  : Color.fromARGB(170, 48, 48, 48),
                              decoration: TextDecoration.underline,
                              decorationColor: testeCor("LENDO")
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
*/
