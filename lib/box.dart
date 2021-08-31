import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  final String name;
  final String img;
  final String rarity;
  final String cost;

  Box({this.name, this.img, this.rarity, this.cost});
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 190,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "${widget.rarity == "MainType.UNCOMMON" ? "assets/img/2.jpg" : widget.rarity == "MainType.RARE" ? "assets/img/3.jpg" : widget.rarity == "MainType.EPIC" ? "assets/img/4.jpg" : widget.rarity == "MainType.LEGENDARY" ? "assets/img/5.jpg" : widget.rarity == "Uncommon" ? "assets/img/2.jpg" : widget.rarity == "Rare" ? "assets/img/3.jpg" : widget.rarity == "Epic" ? "assets/img/4.jpg" : widget.rarity == "Legendary" ? "assets/img/5.jpg" : ""}",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.img != "Img.EMPTY" ? widget.img : widget.img,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 190,
                height: 45,
                child: ColoredBox(
                  color: Colors.black45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                widget.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "fbr",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 14,
                            width: 14,
                            image: AssetImage(
                              "assets/img/vb.png",
                            ),
                          ),
                          Text(
                            widget.cost == "Cost.EMPTY" ? "???" : widget.cost,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
