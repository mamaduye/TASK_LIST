import 'dart:convert';

class AddTaskResponseModel {
    final Data data;
    final Meta meta;

    AddTaskResponseModel({
        required this.data,
        required this.meta,
    });

    factory AddTaskResponseModel.fromJson(String str) => AddTaskResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AddTaskResponseModel.fromMap(Map<String, dynamic> json) => AddTaskResponseModel(
        data: Data.fromMap(json["data"]),
        meta: Meta.fromMap(json["meta"]),
    );

  get statusCode => null;

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "meta": meta.toMap(),
    };
}

class Data {
    final String id;
    final Attributes attributes;

    Data({
        required this.id,
        required this.attributes,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
    };
}

class Attributes {
    final String title;
    final String description;
    final String createdAt;
    final String updatedAt;

    Attributes({
        required this.title,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toMap() => {
    };
}
