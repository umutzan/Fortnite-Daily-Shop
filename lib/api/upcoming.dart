// To parse this JSON data, do
//
//     final fortnite = fortniteFromJson(jsonString);

import 'dart:convert';

Fortnite fortniteFromJson(String str) => Fortnite.fromJson(json.decode(str));

String fortniteToJson(Fortnite data) => json.encode(data.toJson());

class Fortnite {
    Fortnite({
        this.result,
        this.lastUpdate,
        this.items,
    });

    bool result;
    LastUpdate lastUpdate;
    List<Item> items;

    factory Fortnite.fromJson(Map<String, dynamic> json) => Fortnite(
        result: json["result"],
        lastUpdate: LastUpdate.fromJson(json["lastUpdate"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "lastUpdate": lastUpdate.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.id,
        this.type,
        this.name,
        this.description,
        this.rarity,
        this.series,
        this.price,
        this.added,
        this.builtInEmote,
        this.copyrightedAudio,
        this.upcoming,
        this.reactive,
        this.releaseDate,
        this.lastAppearance,
        this.interest,
        this.images,
        this.video,
        this.audio,
        this.gameplayTags,
        this.apiTags,
        this.battlepass,
        this.itemSet,
    });

    String id;
    Rarity type;
    String name;
    String description;
    Rarity rarity;
    Rarity series;
    int price;
    Added added;
    dynamic builtInEmote;
    bool copyrightedAudio;
    bool upcoming;
    bool reactive;
    dynamic releaseDate;
    dynamic lastAppearance;
    double interest;
    Images images;
    String video;
    String audio;
    List<String> gameplayTags;
    List<String> apiTags;
    dynamic battlepass;
    Set itemSet;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        type: Rarity.fromJson(json["type"]),
        name: json["name"],
        description: json["description"],
        rarity: Rarity.fromJson(json["rarity"]),
        series: json["series"] == null ? null : Rarity.fromJson(json["series"]),
        price: json["price"],
        added: Added.fromJson(json["added"]),
        builtInEmote: json["builtInEmote"],
        copyrightedAudio: json["copyrightedAudio"],
        upcoming: json["upcoming"],
        reactive: json["reactive"],
        releaseDate: json["releaseDate"],
        lastAppearance: json["lastAppearance"],
        interest: json["interest"].toDouble(),
        images: Images.fromJson(json["images"]),
        video: json["video"] == null ? null : json["video"],
        audio: json["audio"] == null ? null : json["audio"],
        gameplayTags: List<String>.from(json["gameplayTags"].map((x) => x)),
        apiTags: List<String>.from(json["apiTags"].map((x) => x)),
        battlepass: json["battlepass"],
        itemSet: json["set"] == null ? null : Set.fromJson(json["set"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type.toJson(),
        "name": name,
        "description": description,
        "rarity": rarity.toJson(),
        "series": series == null ? null : series.toJson(),
        "price": price,
        "added": added.toJson(),
        "builtInEmote": builtInEmote,
        "copyrightedAudio": copyrightedAudio,
        "upcoming": upcoming,
        "reactive": reactive,
        "releaseDate": releaseDate,
        "lastAppearance": lastAppearance,
        "interest": interest,
        "images": images.toJson(),
        "video": video == null ? null : video,
        "audio": audio == null ? null : audio,
        "gameplayTags": List<dynamic>.from(gameplayTags.map((x) => x)),
        "apiTags": List<dynamic>.from(apiTags.map((x) => x)),
        "battlepass": battlepass,
        "set": itemSet == null ? null : itemSet.toJson(),
    };
}

class Added {
    Added({
        this.date,
        this.version,
    });

    DateTime date;
    String version;

    factory Added.fromJson(Map<String, dynamic> json) => Added(
        date: DateTime.parse(json["date"]),
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "version": version,
    };
}

class Images {
    Images({
        this.icon,
        this.featured,
        this.background,
        this.fullBackground,
    });

    String icon;
    String featured;
    String background;
    String fullBackground;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        icon: json["icon"],
        featured: json["featured"] == null ? null : json["featured"],
        background: json["background"],
        fullBackground: json["full_background"],
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "featured": featured == null ? null : featured,
        "background": background,
        "full_background": fullBackground,
    };
}

class Set {
    Set({
        this.id,
        this.name,
        this.partOf,
    });

    String id;
    String name;
    String partOf;

    factory Set.fromJson(Map<String, dynamic> json) => Set(
        id: json["id"],
        name: json["name"],
        partOf: json["partOf"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partOf": partOf,
    };
}

class Rarity {
    Rarity({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory Rarity.fromJson(Map<String, dynamic> json) => Rarity(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class LastUpdate {
    LastUpdate({
        this.date,
        this.uid,
    });

    DateTime date;
    String uid;

    factory LastUpdate.fromJson(Map<String, dynamic> json) => LastUpdate(
        date: DateTime.parse(json["date"]),
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "uid": uid,
    };
}
