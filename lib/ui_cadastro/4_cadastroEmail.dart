import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_cadastro/5_cadastroSenha.dart';

class CadastroEmail extends StatefulWidget {
  String nome;
  String cpf;

  CadastroEmail(String nome, String cpf) {
    this.nome = nome;
    this.cpf = cpf;
  }
  @override
  _CadastroEmailState createState() => _CadastroEmailState(nome, cpf);
}

class _CadastroEmailState extends State<CadastroEmail> {
  String nome;
  String cpf;
  _CadastroEmailState(String nome, String cpf) {
    this.nome = nome;
    this.cpf = cpf;
  }
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        top: sizeCard * 0.12, bottom: sizeCard * 0.04),
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
                      padding: EdgeInsets.only(top: sizeCard * 0.04),
                      child: Text(
                        "Caso tenha, digite",
                        style: TextStyle(
                            fontFamily: 'Open Sans Extra Bold',
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontStyle: FontStyle.italic,
                            fontSize: sizeWidth * 0.090,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "seu e-mail",
                      style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontStyle: FontStyle.italic,
                          fontSize: sizeWidth * 0.090,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: sizeCard * 0.06,
                          bottom: sizeCard * 0.01,
                          left: sizeWidth * 0.03),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: sizeCard * 0.015),
                            height: sizeCard * 0.12,
                            width: sizeWidth * 0.9,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Digite aqui",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontStyle: FontStyle.italic,
                                      fontSize: sizeWidth * 0.046,
                                      color: Color.fromARGB(180, 48, 48, 48))),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Insira o seu e-mail!';
                                }
                                if (!EmailValidator.validate(value)) {
                                  return "Email inválido!";
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                          Future.delayed(Duration(milliseconds: 200)).then((_) {
                            Navigator.of(context).pop();
                          });
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
                Padding(
                    padding: EdgeInsets.only(
                        left: sizeWidth * 0.086, top: sizeHeight * 0.025),
                    child: Container(
                      height: sizeHeight * 0.082,
                      width: sizeWidth * 0.4,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CadastrarSenha(
                                    nome, cpf, emailController.text)));
                          }
                        },
                        textColor: Colors.white,
                        splashColor: Color(0xfffab611),
                        color: Color.fromARGB(255, 93, 30, 132),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          "AVANÇAR",
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
        ),
      ),
    );
  }
}
