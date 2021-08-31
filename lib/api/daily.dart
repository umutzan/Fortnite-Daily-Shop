// To parse this JSON data, do
//
//     final fortnite = fortniteFromJson(jsonString);

import 'dart:convert';

Fortnite fortniteFromJson(String str) => Fortnite.fromJson(json.decode(str));

String fortniteToJson(Fortnite data) => json.encode(data.toJson());

class Fortnite {
    Fortnite({
        this.result,
        this.fullShop,
        this.lastUpdate,
        this.currentRotation,
        this.nextRotation,
        this.carousel,
        this.specialOfferVideo,
        this.shop,
    });

    bool result;
    bool fullShop;
    CurrentRotation lastUpdate;
    CurrentRotation currentRotation;
    dynamic nextRotation;
    dynamic carousel;
    dynamic specialOfferVideo;
    List<Shop> shop;

    factory Fortnite.fromJson(Map<String, dynamic> json) => Fortnite(
        result: json["result"],
        fullShop: json["fullShop"],
        lastUpdate: CurrentRotation.fromJson(json["lastUpdate"]),
        currentRotation: CurrentRotation.fromJson(json["currentRotation"]),
        nextRotation: json["nextRotation"],
        carousel: json["carousel"],
        specialOfferVideo: json["specialOfferVideo"],
        shop: List<Shop>.from(json["shop"].map((x) => Shop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "fullShop": fullShop,
        "lastUpdate": lastUpdate.toJson(),
        "currentRotation": currentRotation.toJson(),
        "nextRotation": nextRotation,
        "carousel": carousel,
        "specialOfferVideo": specialOfferVideo,
        "shop": List<dynamic>.from(shop.map((x) => x.toJson())),
    };
}

class CurrentRotation {
    CurrentRotation();

    factory CurrentRotation.fromJson(Map<String, dynamic> json) => CurrentRotation(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Shop {
    Shop({
        this.mainId,
        this.displayName,
        this.displayDescription,
        this.displayType,
        this.mainType,
        this.offerId,
        this.displayAssets,
        this.firstReleaseDate,
        this.previousReleaseDate,
        this.giftAllowed,
        this.buyAllowed,
        this.price,
        this.rarity,
        this.series,
        this.banner,
        this.offerTag,
        this.granted,
        this.priority,
        this.section,
        this.groupIndex,
        this.storeName,
        this.tileSize,
        this.categories,
    });

    String mainId;
    String displayName;
    String displayDescription;
    DisplayType displayType;
    MainType mainType;
    String offerId;
    List<DisplayAsset> displayAssets;
    DateTime firstReleaseDate;
    DateTime previousReleaseDate;
    bool giftAllowed;
    bool buyAllowed;
    Price price;
    Rarity rarity;
    Rarity series;
    Banner banner;
    OfferTag offerTag;
    List<Granted> granted;
    int priority;
    Section section;
    int groupIndex;
    StoreName storeName;
    TileSize tileSize;
    List<String> categories;

    factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        mainId: json["mainId"],
        displayName: json["displayName"],
        displayDescription: json["displayDescription"],
        displayType: displayTypeValues.map[json["displayType"]],
        mainType: mainTypeValues.map[json["mainType"]],
        offerId: json["offerId"],
        displayAssets: List<DisplayAsset>.from(json["displayAssets"].map((x) => DisplayAsset.fromJson(x))),
        firstReleaseDate: DateTime.parse(json["firstReleaseDate"]),
        previousReleaseDate: json["previousReleaseDate"] == null ? null : DateTime.parse(json["previousReleaseDate"]),
        giftAllowed: json["giftAllowed"],
        buyAllowed: json["buyAllowed"],
        price: Price.fromJson(json["price"]),
        rarity: Rarity.fromJson(json["rarity"]),
        series: json["series"] == null ? null : Rarity.fromJson(json["series"]),
        banner: json["banner"] == null ? null : Banner.fromJson(json["banner"]),
        offerTag: json["offerTag"] == null ? null : OfferTag.fromJson(json["offerTag"]),
        granted: List<Granted>.from(json["granted"].map((x) => Granted.fromJson(x))),
        priority: json["priority"],
        section: Section.fromJson(json["section"]),
        groupIndex: json["groupIndex"],
        storeName: storeNameValues.map[json["storeName"]],
        tileSize: tileSizeValues.map[json["tileSize"]],
        categories: List<String>.from(json["categories"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "mainId": mainId,
        "displayName": displayName,
        "displayDescription": displayDescription,
        "displayType": displayTypeValues.reverse[displayType],
        "mainType": mainTypeValues.reverse[mainType],
        "offerId": offerId,
        "displayAssets": List<dynamic>.from(displayAssets.map((x) => x.toJson())),
        "firstReleaseDate": "${firstReleaseDate.year.toString().padLeft(4, '0')}-${firstReleaseDate.month.toString().padLeft(2, '0')}-${firstReleaseDate.day.toString().padLeft(2, '0')}",
        "previousReleaseDate": previousReleaseDate == null ? null : "${previousReleaseDate.year.toString().padLeft(4, '0')}-${previousReleaseDate.month.toString().padLeft(2, '0')}-${previousReleaseDate.day.toString().padLeft(2, '0')}",
        "giftAllowed": giftAllowed,
        "buyAllowed": buyAllowed,
        "price": price.toJson(),
        "rarity": rarity.toJson(),
        "series": series == null ? null : series.toJson(),
        "banner": banner == null ? null : banner.toJson(),
        "offerTag": offerTag == null ? null : offerTag.toJson(),
        "granted": List<dynamic>.from(granted.map((x) => x.toJson())),
        "priority": priority,
        "section": section.toJson(),
        "groupIndex": groupIndex,
        "storeName": storeNameValues.reverse[storeName],
        "tileSize": tileSizeValues.reverse[tileSize],
        "categories": List<dynamic>.from(categories.map((x) => x)),
    };
}

class Banner {
    Banner({
        this.id,
        this.name,
        this.intensity,
    });

    String id;
    String name;
    Intensity intensity;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        name: json["name"],
        intensity: intensityValues.map[json["intensity"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "intensity": intensityValues.reverse[intensity],
    };
}

enum Intensity { LOW, HIGH }

final intensityValues = EnumValues({
    "High": Intensity.HIGH,
    "Low": Intensity.LOW
});

class DisplayAsset {
    DisplayAsset({
        this.displayAsset,
        this.materialInstance,
        this.url,
        this.flipbook,
        this.background,
        this.fullBackground,
    });

    String displayAsset;
    String materialInstance;
    String url;
    dynamic flipbook;
    String background;
    String fullBackground;

    factory DisplayAsset.fromJson(Map<String, dynamic> json) => DisplayAsset(
        displayAsset: json["displayAsset"],
        materialInstance: json["materialInstance"],
        url: json["url"],
        flipbook: json["flipbook"],
        background: json["background"],
        fullBackground: json["full_background"],
    );

    Map<String, dynamic> toJson() => {
        "displayAsset": displayAsset,
        "materialInstance": materialInstance,
        "url": url,
        "flipbook": flipbook,
        "background": background,
        "full_background": fullBackground,
    };
}

enum DisplayType { EPIC, UNCOMMON, RARE, LEGENDARY, ICON_SERIES, DC_SERIES, OUTFIT, BACK_BLING, HARVESTING_TOOL, GLIDER, EMOTE, LOADING_SCREEN, WRAP, MUSIC, SPRAY, THE_5_ITEM_BUNDLE, ITEM_BUNDLE }

final displayTypeValues = EnumValues({
    "BackBling": DisplayType.BACK_BLING,
    "DC SERIES": DisplayType.DC_SERIES,
    "Emote": DisplayType.EMOTE,
    "Epic": DisplayType.EPIC,
    "Glider": DisplayType.GLIDER,
    "Harvesting Tool": DisplayType.HARVESTING_TOOL,
    "Icon Series": DisplayType.ICON_SERIES,
    "Item Bundle": DisplayType.ITEM_BUNDLE,
    "LEGENDARY": DisplayType.LEGENDARY,
    "Loading Screen": DisplayType.LOADING_SCREEN,
    "Music": DisplayType.MUSIC,
    "Outfit": DisplayType.OUTFIT,
    "RARE": DisplayType.RARE,
    "Spray": DisplayType.SPRAY,
    "5 Item Bundle": DisplayType.THE_5_ITEM_BUNDLE,
    "UNCOMMON": DisplayType.UNCOMMON,
    "Wrap": DisplayType.WRAP
});

class Granted {
    Granted({
        this.id,
        this.type,
        this.name,
        this.rarity,
        this.series,
        this.description,
        this.images,
        this.grantedSet,
        this.video,
        this.audio,
        this.gameplayTags,
    });

    String id;
    Rarity type;
    String name;
    Rarity rarity;
    Rarity series;
    String description;
    Images images;
    Set grantedSet;
    String video;
    String audio;
    List<String> gameplayTags;

    factory Granted.fromJson(Map<String, dynamic> json) => Granted(
        id: json["id"],
        type: Rarity.fromJson(json["type"]),
        name: json["name"],
        rarity: Rarity.fromJson(json["rarity"]),
        series: json["series"] == null ? null : Rarity.fromJson(json["series"]),
        description: json["description"],
        images: Images.fromJson(json["images"]),
        grantedSet: json["set"] == null ? null : Set.fromJson(json["set"]),
        video: json["video"] == null ? null : json["video"],
        audio: json["audio"] == null ? null : json["audio"],
        gameplayTags: List<String>.from(json["gameplayTags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type.toJson(),
        "name": name,
        "rarity": rarity.toJson(),
        "series": series == null ? null : series.toJson(),
        "description": description,
        "images": images.toJson(),
        "set": grantedSet == null ? null : grantedSet.toJson(),
        "video": video == null ? null : video,
        "audio": audio == null ? null : audio,
        "gameplayTags": List<dynamic>.from(gameplayTags.map((x) => x)),
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

class Rarity {
    Rarity({
        this.id,
        this.name,
    });

    MainType id;
    DisplayType name;

    factory Rarity.fromJson(Map<String, dynamic> json) => Rarity(
        id: mainTypeValues.map[json["id"]],
        name: displayTypeValues.map[json["name"]],
    );

    Map<String, dynamic> toJson() => {
        "id": mainTypeValues.reverse[id],
        "name": displayTypeValues.reverse[name],
    };
}

enum MainType { EPIC, UNCOMMON, RARE, LEGENDARY, CREATOR_COLLAB_SERIES, DCU_SERIES, OUTFIT, BACKPACK, PICKAXE, GLIDER, EMOTE, LOADINGSCREEN, WRAP, MUSIC, SPRAY, BUNDLE }

final mainTypeValues = EnumValues({
    "backpack": MainType.BACKPACK,
    "bundle": MainType.BUNDLE,
    "CreatorCollabSeries": MainType.CREATOR_COLLAB_SERIES,
    "DCUSeries": MainType.DCU_SERIES,
    "emote": MainType.EMOTE,
    "Epic": MainType.EPIC,
    "glider": MainType.GLIDER,
    "Legendary": MainType.LEGENDARY,
    "loadingscreen": MainType.LOADINGSCREEN,
    "music": MainType.MUSIC,
    "outfit": MainType.OUTFIT,
    "pickaxe": MainType.PICKAXE,
    "Rare": MainType.RARE,
    "spray": MainType.SPRAY,
    "Uncommon": MainType.UNCOMMON,
    "wrap": MainType.WRAP
});

class OfferTag {
    OfferTag({
        this.id,
        this.text,
    });

    String id;
    String text;

    factory OfferTag.fromJson(Map<String, dynamic> json) => OfferTag(
        id: json["id"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
    };
}

class Price {
    Price({
        this.regularPrice,
        this.finalPrice,
    });

    int regularPrice;
    int finalPrice;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        regularPrice: json["regularPrice"],
        finalPrice: json["finalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "regularPrice": regularPrice,
        "finalPrice": finalPrice,
    };
}

class Section {
    Section({
        this.id,
        this.name,
        this.landingPriority,
    });

    String id;
    Name name;
    int landingPriority;

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: nameValues.map[json["name"]],
        landingPriority: json["landingPriority"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "landingPriority": landingPriority,
    };
}

enum Name { ARIANA_GRANDE, RIFT_TOUR, FEATURED, DAILY, BLOODSPORT, SPECIAL_OFFERS }

final nameValues = EnumValues({
    "Ariana Grande": Name.ARIANA_GRANDE,
    "Bloodsport": Name.BLOODSPORT,
    "Daily": Name.DAILY,
    "Featured": Name.FEATURED,
    "Rift Tour": Name.RIFT_TOUR,
    "Special Offers": Name.SPECIAL_OFFERS
});

enum StoreName { BR_SPECIAL_FEATURED, BR_WEEKLY_STOREFRONT, BR_DAILY_STOREFRONT, BR_SPECIAL_DAILY }

final storeNameValues = EnumValues({
    "BRDailyStorefront": StoreName.BR_DAILY_STOREFRONT,
    "BRSpecialDaily": StoreName.BR_SPECIAL_DAILY,
    "BRSpecialFeatured": StoreName.BR_SPECIAL_FEATURED,
    "BRWeeklyStorefront": StoreName.BR_WEEKLY_STOREFRONT
});

enum TileSize { DOUBLE_WIDE, NORMAL, SMALL }

final tileSizeValues = EnumValues({
    "DoubleWide": TileSize.DOUBLE_WIDE,
    "Normal": TileSize.NORMAL,
    "Small": TileSize.SMALL
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
