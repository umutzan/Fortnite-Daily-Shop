import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fbr/box.dart';
import 'package:fbr/api/daily.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "Authorization": "xxxxxxxx-xxxxxxxx-xxxxxxxx-xxxxxxxx"
};

class daily extends StatefulWidget {
  @override
  _dailyState createState() => _dailyState();
}

class _dailyState extends State<daily> {
  Future<Fortnite> _fortniteApiGet() async {
    var res = await http.get(
      "https://fortniteapi.io/v2/shop?lang=en",
      headers: headers,
    );
    if (res.statusCode == 200) {
      return Fortnite.fromJson(json.decode(res.body));
    } else {
      print(res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fortniteApiGet(),
      builder: (BuildContext context, AsyncSnapshot<Fortnite> api) {

        return api.hasData
            ? Container(
                child: api.data.shop.length.isOdd
                    ? ListView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemCount: api.data.shop.length ~/ 2,
                            itemBuilder: (_, index) {
                              index = index + index;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Box(
                                    rarity: api.data.shop[index].rarity.id
                                        .toString(),
                                    img: api
                                        .data.shop[index].displayAssets[0].url
                                        .toString(),
                                    name: api.data.shop[index].displayName
                                        .toString(),
                                    cost: api.data.shop[index].price.finalPrice
                                        .toString(),
                                  ),
                                  Box(
                                    rarity: api.data.shop[index + 1].rarity.id
                                        .toString(),
                                    img: api.data.shop[index + 1]
                                        .displayAssets[0].url
                                        .toString(),
                                    name: api.data.shop[index + 1].displayName
                                        .toString(),
                                    cost: api
                                        .data.shop[index + 1].price.finalPrice
                                        .toString(),
                                  ),
                                ],
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Box(
                                rarity: api
                                    .data
                                    .shop[((api.data.shop.length / 2) + 0.5)
                                        .toInt()]
                                    .rarity
                                    .id
                                    .toString(),
                                img: api
                                    .data
                                    .shop[((api.data.shop.length / 2) + 0.5)
                                        .toInt()]
                                    .displayAssets[0]
                                    .url
                                    .toString(),
                                name: api
                                    .data
                                    .shop[((api.data.shop.length / 2) + 0.5)
                                        .toInt()]
                                    .displayName
                                    .toString(),
                                cost: api
                                    .data
                                    .shop[((api.data.shop.length / 2) + 0.5)
                                        .toInt()]
                                    .price
                                    .finalPrice
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      )
                    : ListView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemCount: api.data.shop.length ~/ 2,
                            itemBuilder: (_, index) {
                              index = index + index;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Box(
                                    rarity: api.data.shop[index].rarity.id
                                        .toString(),
                                    img: api
                                        .data.shop[index].displayAssets[0].url
                                        .toString(),
                                    name: api.data.shop[index].displayName
                                        .toString(),
                                    cost: api.data.shop[index].price.finalPrice
                                        .toString(),
                                  ),
                                  Box(
                                    rarity: api.data.shop[index + 1].rarity.id
                                        .toString(),
                                    img: api.data.shop[index + 1]
                                        .displayAssets[0].url
                                        .toString(),
                                    name: api.data.shop[index + 1].displayName
                                        .toString(),
                                    cost: api
                                        .data.shop[index + 1].price.finalPrice
                                        .toString(),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
