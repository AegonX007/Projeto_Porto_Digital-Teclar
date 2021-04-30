import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class GridDash extends StatelessWidget {
  Item item1 = new Item(img: "images/farmacia.png", caminho: "/Gaveta");
  Item item2 = new Item(img: "images/farmacia.png", caminho: "/Gaveta");
  Item item3 = new Item(img: "images/farmacia.png", caminho: "/RedesSociais");
  Item item4 = new Item(img: "images/farmacia.png");
  Item item5 = new Item(img: "images/farmacia.png");
  Item item6 = new Item(img: "images/farmacia.png");
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
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: myList.map((data) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, data.caminho);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  data.img,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
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
