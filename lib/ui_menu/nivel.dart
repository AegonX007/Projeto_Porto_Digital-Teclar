import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nivel extends StatefulWidget {
  String nome;

  CadastroEmail(String nome) {
    this.nome = nome;
  }

  @override
  _NivelState createState() => _NivelState(nome);
}

class _NivelState extends State<Nivel> {
  String nome;

  _NivelState(String nome) {
    this.nome = nome;
  }

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeTop = MediaQuery.of(context).padding.top;
    var sizeCard = (sizeHeight - sizeTop) * 0.7;

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
                  color: Color.fromARGB(205, 93, 30, 132),
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
      body: Container(
        height: sizeCard,
        width: sizeWidth,
        color: Colors.white,
        child: Scrollbar(
            thickness: sizeWidth * 0.02,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: Text(
                      nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Open Sans Extra Bold',
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontSize: 25.ssp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
