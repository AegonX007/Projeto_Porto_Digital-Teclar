import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_splash_screen/main.dart';
import 'package:material_splash_screen/ui_login/esqueceuSenha.dart';
import 'package:material_splash_screen/ui_menu/1_Menu.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _exibirSenha = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeCard = sizeHeight * 0.867;

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
                  Padding(
                    padding: EdgeInsets.only(
                        top: sizeCard * 0.12, bottom: sizeCard * 0.08),
                    child: Center(
                      child: Image.asset(
                        "images/LOGOTIPO.png",
                        fit: BoxFit.contain,
                        height: sizeHeight * 0.15,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: sizeCard * 0.005),
                      child: Text(
                        "Realize o seu login:",
                        style: TextStyle(
                            fontFamily: 'Open Sans Extra Bold',
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontStyle: FontStyle.italic,
                            fontSize: sizeWidth * 0.09,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey1,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: sizeCard * 0.04,
                            bottom: sizeCard * 0.01,
                            left: sizeWidth * 0.03),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "EMAIL:",
                                  style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      color: Color.fromARGB(210, 48, 48, 48),
                                      fontSize: sizeWidth * 0.08,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: sizeCard * 0.02),
                                  padding:
                                      EdgeInsets.only(left: sizeCard * 0.02),
                                  height: sizeCard * 0.1,
                                  width: sizeWidth * 0.656,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "DIGITE AQUI",
                                        hintStyle: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontStyle: FontStyle.italic,
                                            fontSize: sizeWidth * 0.04,
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
                                Container(
                                  padding:
                                      EdgeInsets.only(left: sizeCard * 0.01),
                                ),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.only(top: sizeCard * 0.01),
                            ), // ----------------------------------------------------

                            Row(
                              children: <Widget>[
                                Text(
                                  "SENHA:",
                                  style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      color: Color.fromARGB(210, 48, 48, 48),
                                      fontSize: sizeWidth * 0.08,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: sizeCard * 0.02),
                                  padding:
                                      EdgeInsets.only(left: sizeCard * 0.007),
                                  height: sizeCard * 0.1,
                                  width: sizeWidth * 0.632,
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    controller: senhaController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "             DIGITE AQUI",
                                        hintStyle: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontStyle: FontStyle.italic,
                                            fontSize: sizeWidth * 0.04,
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

                            // ESQUECI A MINHA SENHA
                            // ---------------------------------------------

                            Container(
                              child: Container(
                                height: sizeHeight * 0.08,
                                width: sizeWidth * 0.75,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EsqueceuSenha()));
                                  },
                                  color: Color.fromARGB(255, 93, 30, 132),
                                  splashColor: Color(0xfffab611),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "ESQUECEU A SENHA?",
                                    style: TextStyle(
                                      fontFamily: 'Open Sans Extra Bold',
                                      color: Colors.white,
                                      fontSize: sizeWidth * 0.06,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.only(top: sizeCard * 0.08),
                            ),
                          ],
                        )),
                  )
                ],
              )),

          // ? BOTÕES DE "VOLTAR" E "ENTRAR"
          //------------------------------------------------------------------------

          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: sizeWidth * 0.06, top: sizeHeight * 0.025),
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
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
              Container(
                  margin: EdgeInsets.only(
                      left: sizeWidth * 0.086, top: sizeHeight * 0.025),
                  child: Container(
                    height: sizeHeight * 0.082,
                    width: sizeWidth * 0.4,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey1.currentState.validate()) {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          auth
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: senhaController.text)
                              .then((firebaseUser) {
                            print("Logar usuário: sucesso! email:" +
                                firebaseUser.email);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MenuInicial()));
                          }).catchError((erro) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                    janelaPopUp(sizeWidth, sizeHeight));
                          });
                        }
                      },
                      textColor: Colors.white,
                      splashColor: Color(0xfffab611),
                      color: Color.fromARGB(255, 93, 30, 132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.black)),
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          fontSize: (sizeWidth * 0.35) * 0.18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ))
            ],
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
        Container(
          height: sizeHeight * 0.07,
          width: sizeWidth * 0.65,
          margin: EdgeInsets.only(
              right: sizeWidth * 0.05, bottom: sizeHeight * 0.01),
          child: Expanded(
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
                "Entendi",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Open Sans Extra Bold',
                  fontSize: sizeWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
