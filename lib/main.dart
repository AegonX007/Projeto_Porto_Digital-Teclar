import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_splash_screen/entity/usuario.dart';
import 'package:material_splash_screen/ui_login/login.dart';
import 'package:material_splash_screen/ui_cadastro/cadastroVideo.dart';
import 'package:material_splash_screen/ui_menu/1_Menu.dart';
import 'package:material_splash_screen/ui_menu/Ecommerce.dart';
import 'package:material_splash_screen/ui_menu/Farmacias.dart';
import 'package:material_splash_screen/ui_menu/Financeiros.dart';
import 'package:material_splash_screen/ui_menu/Redes_Sociais.dart';
import 'package:material_splash_screen/ui_menu/Transportes.dart';
import 'package:material_splash_screen/ui_menu/alterarDados.dart';
import 'package:material_splash_screen/ui_menu/alterar_dados/alterarEmail.dart';
import 'package:material_splash_screen/ui_menu/alterar_dados/alterarFotoPerfil.dart';
import 'package:material_splash_screen/ui_menu/alterar_dados/alterarNome.dart';
import 'package:material_splash_screen/ui_menu/alterar_dados/alterarSenha.dart';
import 'package:material_splash_screen/ui_menu/Restaurantes.dart';
import 'package:material_splash_screen/ui_menu/gaveta.dart';
import 'package:material_splash_screen/ui_menu/meuPerfil.dart';
import 'package:material_splash_screen/ui_menu/opcoesFarmacia.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  //Firestore db = Firestore.instance;
  //db.collection("cursos").doc("Ifood").delete(); // ? Deletando dados

  // ? Recuperando os dados de uma pessoa
  /*DocumentSnapshot snapshot =
      await db.collection("usuarios").doc("IDtSdJojTirEMjFL7lnV").get();
  var dados = snapshot.data();
  print("Dados: \n" + "Nome " + dados["nome"]);*/

  // ? Recuperando todos os dados
  /*QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .where("nome", isEqualTo: "Leonilda")
      .getDocuments();
  print("Dados usuarios: \n");
  for (DocumentSnapshot item in querySnapshot.documents) {
    item.data["nome"] = "Teste";
    var dados = item.data;
    print("CPF: " + dados["cpf"] + " - " + "Nome: " + dados["nome"]);
  }*/

  // ? Diferente a recuperação dos dados anterior, nesse aqui
  // ? sempre que ocorrer alguma mudança no banco, ele ira
  // ?  atualizar automaticamente aqui também.
  /*db.collection("usuarios").snapshots().listen((snapshot) {
    for (DocumentSnapshot item in snapshot.docs) {
      var dados = item.data();
      print("CPF: " + dados["cpf"] + " - " + "Nome: " + dados["nome"]);
    }
  });*/

  // ? Aplicando Filtros
  /*QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      //.where("nome", isEqualTo: "Lucas Gabriel")
      //.where("email", isEqualTo: "")
      .orderBy("nome", descending: false)
      .limit(2)
      .get();
  for (DocumentSnapshot item in querySnapshot.docs) {
    var dados = item.data();
    print("Filtro - CPF: " + dados["cpf"] + " - " + "Nome: " + dados["nome"]);
  }*/

  // ? Pesquisa de texto
  /*QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .where("nome",
          isLessThanOrEqualTo: "Lucas" +
              "\uf8ff") // ! Código mundialmente usado para realizar a pesquisa
      .where("nome", isGreaterThanOrEqualTo: "Lucas")
      .get();
  for (DocumentSnapshot item in querySnapshot.docs) {
    var dados = item.data();
    print("Filtro - CPF: " + dados["cpf"] + " - " + "Nome: " + dados["nome"]);
  }*/

  // ? Cadastro e Verificação de Usuário Logado
  /*FirebaseAuth auth = FirebaseAuth.instance;
  String email = "lucas@gmail.com";
  String senha = "fsa5169";*/
  /*auth
      .createUserWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print("Novo usuário: sucesso! email:" + firebaseUser.user.email);
  }).catchError((erro) {
    print("Novo usuário: erro " + erro.toString());
  });*/

  // ? Verificando qual usuário está logado
  /*User usuarioAtual = await auth.currentUser;
  if (usuarioAtual != null) {
    print("Usuário logado email: " + usuarioAtual.email);
  } else {
    //deslogado
  }*/

  // ? Logando usuário
  /*auth
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((firebaseUser) {
    print("Logar usuário: sucesso! email:" + firebaseUser.user.email);
  }).catchError((erro) {
    print("Logar usuário: erro " + erro.toString());
  });*/

  // ? Deslogando usuário
  //auth.signOut();

  // ? Upload de Imagem no firebase
  /*Future _uploadImagem() async {
    // ! Referenciar arquivo]
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    //Fazer upload da imagem
    arquivo.putFile(_imagem);
  }*/
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Iniciar());
}

class Iniciar extends StatelessWidget {
  OpcoesFarmacia opcoes;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      ScreenUtil.init(constraints,
          designSize: Size(392.72727272727275, 781.0909090909091),
          allowFontScaling: false);
      return MaterialApp(
          title: "Teclar",
          home: Splash(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              hintColor: Color(0xff004349).withOpacity(0.90),
              primaryColor: Colors.deepPurple,
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                hintStyle: TextStyle(color: Colors.orange),
              )),
          initialRoute: "/",
          routes: {
            "/Home": (context) => Home(),
            "/Login": (context) => Login(),
            "/RedesSociais": (context) => RedesSociais(),
            "/Gaveta": (context) => GavetaMenu(),
            "/MeuPerfil": (context) => MeuPerfil(),
            "/AlterarDados": (context) => AlterarDados(),
            "/AlterarNome": (context) => AlterarNome(),
            "/AlterarSenha": (context) => AlterarSenha(),
            "/AlterarEmail": (context) => AlterarEmail(),
            "/AlterarFotoPerfil": (context) => AlterarFotoPerfil(),
            "/Menu": (context) => MenuGrid(),
            "/Farmacias": (context) => Farmacias(),
            "/Transportes": (context) => Transportes(),
            "/Restaurantes": (context) => Restaurantes(),
            "/Ecommerce": (context) => Ecommerce(),
            "/Financeiros": (context) => Financeiros(),
            "/opcoesFarmacia": (context) => OpcoesFarmacia(),
          });
    });
  }
}

/*
MaterialApp(
        title: "Teclar",
        home: Splash(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            hintColor: Color(0xff004349).withOpacity(0.90),
            primaryColor: Colors.deepPurple,
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange)),
              hintStyle: TextStyle(color: Colors.orange),
            )),
        initialRoute: "/",
        routes: {
          "/Home": (context) => Home(),
          "/Login": (context) => Login(),
          "/Menu": (context) => MenuInicial(),
          "/Gaveta": (context) => GavetaMenu(),
          "/MeuPerfil": (context) => MeuPerfil(),
          "/AlterarDados": (context) => AlterarDados(),
          "/AlterarNome": (context) => AlterarNome(),
          "/AlterarSenha": (context) => AlterarSenha(),
          "/AlterarEmail": (context) => AlterarEmail(),
          "/AlterarFotoPerfil": (context) => AlterarFotoPerfil(),
        }),
*/

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 30, 132),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.34,
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: Center(
              child: Image.asset(
                "images/LOGOTIPO2.png",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.23,
              ),
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: FlareActor(
                'assets/logotipo2.flr',
                animation: "logo",
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Column(
                children: [
                  Text(
                    "from",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        fontFamily: 'Open Sans Extra Bold',
                        color: Color.fromARGB(255, 242, 178, 42),
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Color.fromARGB(255, 242, 178, 42),
                          )
                        ]),
                  ),
                  Text(
                    "WAKANDA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontFamily: 'Open Sans Extra Bold',
                        color: Color.fromARGB(255, 242, 178, 42),
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Color.fromARGB(255, 242, 178, 42),
                          )
                        ]),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((_) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseUser usuarioAtual = await auth.currentUser();
      if (usuarioAtual != null) {
        Navigator.pushNamed(context, "/Menu");
      } else {
        Navigator.pushNamed(context, "/Home");
      }
    });
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String email1;
    String email2;
    bool _exibirProgressBar = false;
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizecard = sizeHeight * 0.867;

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 178, 42),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                      height: sizecard,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black38),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100.h, bottom: 30.h),
                            child: Center(
                              child: Image.asset(
                                "images/LOGOTIPO.png",
                                fit: BoxFit.contain,
                                height: 120.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
                            child: Text(
                              "Seja bem-vindo!",
                              style: TextStyle(
                                  fontFamily: 'Open Sans Extra Bold',
                                  color: Color.fromARGB(255, 93, 30, 132),
                                  fontSize: 38.ssp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          /* Container(
                              height: sizeHeight * 0.006,
                              width: sizeWidth * 0.15,
                              color: Color(0xfffab611)
                              //color: Color(0xff670099).withOpacity(0.69),
                              ),*/
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Text(
                              "O que deseja fazer?",
                              style: TextStyle(
                                  fontFamily: 'Open Sans Extra Bold',
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  fontSize: 25.ssp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //? BOTOES MEU LOGIN E NAO TENHO CADASTRO ---------------------
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 40.w, right: 40.w, top: 35.h),
                              child: Container(
                                height: 52.h,
                                width: 320.w,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/Login");
                                  },
                                  textColor: Colors.white,
                                  splashColor: Color(0xfffab611),
                                  color: Color.fromARGB(255, 93, 30, 132),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "MEU LOGIN",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      fontSize: 18.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 40.w, right: 40.w, top: 20.h),
                              child: Container(
                                height: 52.h,
                                width: 320.w,
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  splashColor: Color(0xfffab611),
                                  color: Color.fromARGB(255, 93, 30, 132),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    /*showDialog(
                                    context: context,
                                    builder: (_) =>
                                        janelaPopUp(sizeWidth, sizeHeight));*/
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Cadastrar1()));
                                  },
                                  child: Text(
                                    "NÃO TENHO CADASTRO",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      fontSize: 18.ssp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                          /*Center(
                            child: Text(
                              "cadastro?",
                              style: TextStyle(
                                  fontFamily: 'Open Sans Extra Bold',
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  fontSize: sizeWidth * 0.085,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),*/
                        ],
                      )),

                  //?BOTÃO DO GOOGLE---------------------------------------------
                  //-------------------------------------------------------------

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Container(
                          height: 62.h,
                          width: 320.w,
                          child: RaisedButton.icon(
                            onPressed: () async {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              final googleSignIn = GoogleSignIn();
                              final user = await googleSignIn.signIn();
                              final googleAuth = await user.authentication;
                              final credential =
                                  GoogleAuthProvider.getCredential(
                                      idToken: googleAuth.idToken,
                                      accessToken: googleAuth.accessToken);
                              Firestore db = Firestore.instance;

                              QuerySnapshot querySnapshot = await db
                                  .collection("usuarios")
                                  .where("email", isEqualTo: user.email)
                                  .where("senha", isEqualTo: user.id)
                                  .getDocuments();
                              for (DocumentSnapshot item
                                  in querySnapshot.documents) {
                                var dados = item.data;
                                email1 = dados["email"];
                                email2 = user.email;
                              }

                              if (email1 == null) {
                                auth
                                    .createUserWithEmailAndPassword(
                                        email: user.email, password: user.id)
                                    .then((firebaseUser) {
                                  print("Novo usuário: sucesso! email:" +
                                      firebaseUser.email);
                                }).catchError((erro) {
                                  print(
                                      "Novo usuário: erro " + erro.toString());
                                });

                                Firestore db = Firestore.instance;
                                db // ? O DocumentReferences foi utilizado nesse caso para obter o doc
                                    .collection("usuarios")
                                    .document(user.email)
                                    .setData({
                                  "nome": user.displayName,
                                  "email": user.email,
                                  "senha": user.id,
                                  "urlImagemPerfil": user.photoUrl,
                                  "pontuacao": 0,
                                  "premium": false,
                                }).catchError((err) {
                                  print("usuario já existe.");
                                });
                                setState(() {
                                  _exibirProgressBar = true;
                                });
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MenuGrid()));
                              } else {
                                setState(() {
                                  _exibirProgressBar = true;
                                });
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MenuGrid()));
                              }
                            },
                            color: Colors.grey[850],
                            splashColor: Colors.purple[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(color: Colors.grey[850])),
                            icon: FaIcon(FontAwesomeIcons.google,
                                color: Colors.white),
                            label: Text(
                              "ENTRAR COM GOOGLE",
                              style: TextStyle(
                                fontFamily: 'Open Sans Extra Bold',
                                color: Colors.white,
                                fontSize: 18.ssp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: (_exibirProgressBar == true)
                    ? showProgressBar(sizeHeight, sizeWidth)
                    : Container(),
              )
            ],
          ),
        ));
  }

  Widget showProgressBar(double sizeHeight, double sizeWidth) {
    return Container(
      margin: EdgeInsets.only(top: sizeHeight * 0.5),
      height: sizeHeight * 0.15,
      width: sizeWidth * 0.3,
      child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 10, 238, 248))),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
  /*AlertDialog janelaPopUp(double sizeWidth, double sizeHeight) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 24,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.black)),
      title: Text(
        "Como você deseja se cadastrar!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 93, 30, 132),
          fontFamily: 'Open Sans Extra Bold',
          fontSize: sizeWidth * 0.08,
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
                onPressed: () {},
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
  }*/
}

// TODO - ABERTURA 1
/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 30, 132),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.9,
          child: FlareActor('assets/logotipo.flr', animation: "logo",),
        ),
      ),
    );
  }

*/

// TODO - ABERTURA 2
/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 30, 132),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.34, bottom: MediaQuery.of(context).size.height * 0.1),
            child: Center(
              child: Image.asset(
                "images/LOGOTIPO2.png",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.23,
              ),
            ),
          ),

          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: FlareActor('assets/logotipo2.flr', animation: "logo",),
            ),
          ),
        ],
      ),
    );
  }
 */

/*

Container(


width: 250,
margin:  EdgeInsets.all(15.0),
padding:  EdgeInsets.all(3.0),
decoration: BoxDecoration(
borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
),
child: Text("My Awesome Border", style: TextStyle(color: Colors.red),),
)

*/

/*class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Flutter + Flare",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 100,
            width: 100,
            child: FlareActor('assets/coracao.flr', animation: "heart"),
          )
        ],
      ),
    );
  }
}*/
