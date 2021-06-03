import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GridFarmacia extends StatelessWidget {
  Item item1 =
      new Item(img: "images/paguemenos.png", caminho: "/opcoesFarmacia");
  Item item2 = new Item(img: "images/drogasil.png", caminho: "/opcoesFarmacia");
  Item item3 =
      new Item(img: "images/extrafarma.png", caminho: "/opcoesFarmacia");
  Item item4 =
      new Item(img: "images/drogariaSaoPaulo.jpg", caminho: "/opcoesFarmacia");
  Item item5 = new Item(
      img: "images/farmacias-independente.jpg", caminho: "/opcoesFarmacia");
  Item item6 =
      new Item(img: "images/drogaraia.jpg", caminho: "/opcoesFarmacia");
  @override
  Widget build(BuildContext context) {
    List<Item> myList = [item1, item2, item3, item4, item5, item6];
    return Container(
        child: GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      childAspectRatio: 1.0,
      padding: EdgeInsets.only(left: 16, right: 15),
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: myList.map((data) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.transparent),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.white),
          child: RaisedButton(
              splashColor: Color(0xfffab611),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, data.caminho);
              },
              child: Stack(
                children: <Widget>[
                  Image.asset(data.img, scale: 1),
                ],
              )),
        );
      }).toList(),
    ));
  }
}

class Item {
  String img;
  String caminho;
  Item({this.img, this.caminho});
}
