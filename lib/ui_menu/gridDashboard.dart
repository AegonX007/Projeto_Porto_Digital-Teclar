import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridDash extends StatelessWidget {
  Item item1 = new Item(
      title: "FARMÁCIAS", img: "images/farmacia.png", caminho: "/Gaveta");
  Item item2 = new Item(
      title: "GASTRONOMIA", img: "images/farmacia.png", caminho: "/Gaveta");
  Item item3 = new Item(
      title: "REDES SOCIAIS",
      img: "images/farmacia.png",
      caminho: "/RedesSociais");
  Item item4 = new Item(title: "TRANSPORTES", img: "images/farmacia.png");
  Item item5 = new Item(title: "MERCADOS", img: "images/farmacia.png");
  Item item6 = new Item(title: "BANCOS", img: "images/farmacia.png");
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
                color: Color.fromARGB(255, 93, 30, 132),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  data.img,
                  width: 70.w,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: Colors.black38),
                      color: Colors.yellow[800]),
                  child: Text(
                    data.title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 93, 30, 132),
                        fontSize: 22.ssp,
                        fontWeight: FontWeight.w600),
                  ),
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
  String title;
  String img;
  String caminho;
  Item({this.title, this.img, this.caminho});
}
