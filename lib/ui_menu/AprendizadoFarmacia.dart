import 'package:flutter/material.dart';
import 'package:material_splash_screen/ui_menu/desenvolvimento.dart';

class TelaAprendizadoFarmacia extends StatelessWidget {
  final int page;

  const TelaAprendizadoFarmacia({Key key, this.page}) : super(key: key);

  void verificarTela(context, String nome, int nomeTipo) {
    if (page == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Desenvolvimento()));
    } else if (page == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Desenvolvimento()));
    } else if (page == 3) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Desenvolvimento()));
    } else if (page == 4) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Desenvolvimento()));
    } else if (page == 5) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Desenvolvimento()));
    } else {
      return null;
    }
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
                      "Como você pretende aprender?",
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
                                      image: AssetImage("images/movie.png"))),
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
                                                  Desenvolvimento()));
                                    },
                                    child: Text(
                                      "ASSISTINDO",
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
                                      image: AssetImage("images/audio.png"))),
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
                                                  Desenvolvimento()));
                                    },
                                    child: Text(
                                      "OUVINDO",
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
                                      image: AssetImage("images/book.png"))),
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
                                                  Desenvolvimento()));
                                    },
                                    child: Text(
                                      "LENDO",
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
