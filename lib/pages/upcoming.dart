import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fbr/box.dart';
import 'package:fbr/api/upcoming.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Map<String, String> headers = {
  "Authorization": "xxxxxxxx-xxxxxxxx-xxxxxxxx-xxxxxxxx"
};

class upcoming extends StatefulWidget {
  @override
  _upcomingState createState() => _upcomingState();
}

class _upcomingState extends State<upcoming> {
  Future<Fortnite> _fortniteApiGet() async {
    var res = await http.get(
      "https://fortniteapi.io/v2/items/upcoming?lang=en",
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
                child: api.data.items.length.isOdd
                    ? ListView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemCount: api.data.items.length ~/ 2,
                            itemBuilder: (_, index) {
                              index = index + index;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Box(
                                    rarity: api.data.items[index].rarity.id
                                        .toString(),
                                    img: (api.data.items[index].images.featured
                                                .toString()) ==
                                            "null"
                                        ? api.data.items[index].images.icon
                                            .toString()
                                        : api.data.items[index].images.featured
                                            .toString(),
                                    name: api.data.items[index].name.toString(),
                                    cost: "???",
                                  ),
                                  Box(
                                    rarity: api.data.items[index + 1].rarity.id
                                        .toString(),
                                    img: (api.data.items[index + 1].images
                                                .featured
                                                .toString()) ==
                                            "null"
                                        ? api.data.items[index + 1].images.icon
                                            .toString()
                                        : api.data.items[index + 1].images
                                            .featured
                                            .toString(),
                                    name: api.data.items[index + 1].name
                                        .toString(),
                                    cost: "???",
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
                                    .items[((api.data.items.length / 2) + 0.5)
                                        .toInt()]
                                    .rarity
                                    .id
                                    .toString(),
                                img: (api
                                            .data
                                            .items[
                                                ((api.data.items.length / 2) +
                                                        0.5)
                                                    .toInt()]
                                            .images
                                            .featured
                                            .toString()) ==
                                        "null"
                                    ? api
                                        .data
                                        .items[
                                            ((api.data.items.length / 2) + 0.5)
                                                .toInt()]
                                        .images
                                        .icon
                                        .toString()
                                    : api
                                        .data
                                        .items[
                                            ((api.data.items.length / 2) + 0.5)
                                                .toInt()]
                                        .images
                                        .featured
                                        .toString(),
                                name: api
                                    .data
                                    .items[((api.data.items.length / 2) + 0.5)
                                        .toInt()]
                                    .name
                                    .toString(),
                                cost: "???",
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
                            itemCount: api.data.items.length ~/ 2,
                            itemBuilder: (_, index) {
                              index = index + index;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Box(
                                    rarity: api.data.items[index].rarity.id
                                        .toString(),
                                    img: (api.data.items[index].images.featured
                                                .toString()) ==
                                            "null"
                                        ? api.data.items[index].images.icon
                                            .toString()
                                        : api.data.items[index].images.featured
                                            .toString(),
                                    name: api.data.items[index].name.toString(),
                                    cost: "???",
                                  ),
                                  Box(
                                    rarity: api.data.items[index + 1].rarity.id
                                        .toString(),
                                    img: (api.data.items[index + 1].images
                                                .featured
                                                .toString()) ==
                                            "null"
                                        ? api.data.items[index + 1].images.icon
                                            .toString()
                                        : api.data.items[index + 1].images
                                            .featured
                                            .toString(),
                                    name: api.data.items[index + 1].name
                                        .toString(),
                                    cost: "???",
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
