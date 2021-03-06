import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GridDash extends StatelessWidget {
  Item item1 = new Item(img: "images/farmacia.png", caminho: "/Farmacias");
  Item item2 =
      new Item(img: "images/gastronomia.png", caminho: "/Restaurantes");
  Item item3 =
      new Item(img: "images/redes_sociais.png", caminho: "/RedesSociais");
  Item item4 = new Item(img: "images/transportes.png", caminho: "/Transportes");
  Item item5 = new Item(img: "images/ecommerce.png", caminho: "/Ecommerce");
  Item item6 = new Item(img: "images/financeiro.png", caminho: "/Financeiros");
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
