import 'dart:convert';

//model class
//perfroms json parsing

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  Feed({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.title,
    this.type,
    this.components,
    this.coverUrl,
  });

  String? title;
  String? type;
  List<Component>? components;
  String? coverUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        type: json["type"],
        components: List<Component>.from(
            json["components"].map((x) => Component.fromJson(x))),
        coverUrl: json["coverUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
        "components": List<dynamic>.from(components!.map((x) => x.toJson())),
        "coverUrl": coverUrl,
      };
}

class Component {
  Component({
    this.type,
    this.url,
    this.title,
    this.desc,
  });

  Type? type;
  String? url;
  String? title;
  String? desc;

  factory Component.fromJson(Map<String, dynamic> json) => Component(
        type: typeValues.map![json["type"]],
        url: json["url"],
        title: json["title"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse![type],
        "url": url,
        "title": title,
        "desc": desc,
      };
}

enum Type { image, text }

final typeValues = EnumValues({"image": Type.image, "text": Type.text});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap;
    return reverseMap;
  }
}
