import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_splash_screen/entity/usuario.dart';
import 'package:material_splash_screen/main.dart';
import 'package:material_splash_screen/ui_cadastro/cadastroVideo.dart';
import 'package:material_splash_screen/ui_menu/1_Menu.dart';
import 'package:material_splash_screen/ui_menu/Redes_Sociais.dart';
import 'package:material_splash_screen/ui_login/esqueceuSenha.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _exibirSenha = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  Future<bool> _recuperarDados() async {
    Firestore db = Firestore.instance;

    QuerySnapshot querySnapshot = await db
        .collection("usuarios")
        .where("email", isEqualTo: emailController.text)
        .where("senha", isEqualTo: senhaController.text)
        .getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var topo = MediaQuery.of(context).padding.top;
    var sizeCard = sizeHeight * 0.9;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 178, 42),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              height: sizeCard,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: topo + 20.h, bottom: 30.h),
                    child: Center(
                      child: Image.asset(
                        "images/LOGOTIPO.png",
                        fit: BoxFit.contain,
                        height: 80.h,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 150.w),
                      child: Text(
                        "Faça o seu login:",
                        style: TextStyle(
                            fontFamily: 'Open Sans Extra Bold',
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontStyle: FontStyle.italic,
                            fontSize: 22.ssp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey1,
                    child: Padding(
                        padding: EdgeInsets.only(top: 30.h, right: 10.w),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 230.w),
                              child: Text(
                                "SEU EMAIL:",
                                style: TextStyle(
                                    fontFamily: 'Open Sans Bold',
                                    color: Color.fromARGB(210, 48, 48, 48),
                                    fontSize: 19.ssp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  padding: EdgeInsets.only(left: 25.w),
                                  height: 55.h,
                                  width: 365.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "DIGITE AQUI...",
                                        hintStyle: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontStyle: FontStyle.italic,
                                            fontSize: 19.ssp,
                                            color: Color.fromARGB(
                                                180, 48, 48, 48))),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Insira o seu e-mail!';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return "E-mail inválido!";
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 20.h),
                            ), // ----------------------------------------------------
                            Padding(
                              padding: EdgeInsets.only(right: 220.w),
                              child: Text(
                                "SUA SENHA:",
                                style: TextStyle(
                                    fontFamily: 'Open Sans Bold',
                                    color: Color.fromARGB(210, 48, 48, 48),
                                    fontSize: 19.ssp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 5.h),
                                  padding: EdgeInsets.only(left: 25.w),
                                  height: 55.h,
                                  width: 365.w,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                    controller: senhaController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "DIGITE AQUI....",
                                        hintStyle: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontStyle: FontStyle.italic,
                                            fontSize: 19.ssp,
                                            color: Color.fromARGB(
                                                180, 48, 48, 48)),
                                        suffixIcon: GestureDetector(
                                          child: Icon(
                                            _exibirSenha == false
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _exibirSenha = !_exibirSenha;
                                            });
                                          },
                                        )),
                                    obscureText:
                                        _exibirSenha == false ? true : false,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Insira a sua Senha!';
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            //?BOTAO DE ENTRAR
                            //-----------------------------------
                            Container(
                                margin: EdgeInsets.only(top: 20.h),
                                padding:
                                    EdgeInsets.only(left: 11.w, right: 5.w),
                                child: Container(
                                  height: 55.h,
                                  width: 342.w,
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (_formKey1.currentState.validate()) {
                                        bool teste = await _recuperarDados();
                                        if (teste == true) {
                                          FirebaseAuth auth =
                                              FirebaseAuth.instance;
                                          auth
                                              .signInWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      senhaController.text)
                                              .then((firebaseUser) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MenuGrid()));
                                          }).catchError((erro) {});
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (_) => janelaPopUp(
                                                  sizeWidth, sizeHeight));
                                        }
                                      }
                                    },
                                    textColor: Colors.white,
                                    splashColor: Color(0xfffab611),
                                    color: Color.fromARGB(255, 93, 30, 132),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(color: Colors.black)),
                                    child: Text(
                                      "ENTRAR",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans Extra Bold',
                                        fontSize: 22.ssp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )),

                            // ESQUECI A MINHA SENHA
                            // ---------------------------------------------
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: TextButton(
                                  child: Text(
                                    "ESQUECEU A SENHA?",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      color: Color.fromARGB(255, 93, 30, 132),
                                      fontSize: 16.ssp,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EsqueceuSenha()));
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20.w),
                          height: 2.h,
                          width: 132.w,
                          color: Color.fromARGB(255, 93, 30, 132),
                        ),
                        Container(
                          child: Text(
                            "Ou",
                            style: TextStyle(
                              fontFamily: 'Open Sans Extra Bold',
                              color: Color.fromARGB(255, 93, 30, 132),
                              fontSize: 16.ssp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w),
                          height: 2.h,
                          width: 132.w,
                          color: Color.fromARGB(255, 93, 30, 132),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Container(
                        height: 55.h,
                        width: 342.w,
                        child: RaisedButton.icon(
                          onPressed: () async {
                            bool verdade = true;
                            FirebaseAuth auth = FirebaseAuth.instance;
                            final googleSignIn = GoogleSignIn();
                            final user = await googleSignIn.signIn();
                            final googleAuth = await user.authentication;
                            final credential = GoogleAuthProvider.getCredential(
                                idToken: googleAuth.idToken,
                                accessToken: googleAuth.accessToken);
                            Future<void> _recuperarDados() async {
                              Firestore db = Firestore.instance;

                              QuerySnapshot querySnapshot = await db
                                  .collection("usuarios")
                                  .where("email", isEqualTo: user.email)
                                  .where("senha", isEqualTo: user.id)
                                  .getDocuments();
                              for (DocumentSnapshot item
                                  in querySnapshot.documents) {
                                return verdade = true;
                              }
                              return verdade = false;
                            }

                            if (verdade == false) {
                              auth
                                  .createUserWithEmailAndPassword(
                                      email: user.email, password: user.id)
                                  .then((firebaseUser) {
                                print("Novo usuário: sucesso! email:" +
                                    firebaseUser.email);
                              }).catchError((erro) {
                                print("Novo usuário: erro " + erro.toString());
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
                                "pontuacao": 0
                              }).catchError((err) {
                                print("usuario já existe.");
                              });
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MenuGrid()));
                            } else {
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MenuGrid()));
                            }
                          },
                          color: Colors.blueGrey,
                          splashColor: Color(0xfffab611),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(color: Colors.black)),
                          icon: FaIcon(FontAwesomeIcons.google,
                              color: Colors.yellow),
                          label: Text(
                            "ENTRAR COM GOOGLE",
                            style: TextStyle(
                              fontFamily: 'Open Sans Extra Bold',
                              color: Colors.white,
                              fontSize: 19.ssp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),

          // ? NÃO TEM CADASTRO
          //------------------------------------------------------------------------

          Center(
            child: Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.019),
              child: TextButton(
                child: Text(
                  "Ops! Ainda não tenho Cadastro!",
                  style: TextStyle(
                    fontFamily: 'Open Sans Extra Bold',
                    color: Color.fromARGB(255, 93, 30, 132),
                    fontSize: 19.ssp,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Cadastrar1()));
                },
              ),
            ),
          ),
        ],
      )),
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
        "Erro!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 93, 30, 132),
          fontFamily: 'Open Sans Extra Bold',
          fontSize: sizeWidth * 0.09,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Usúario ou senha incorreto!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
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
                  "Ok",
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
