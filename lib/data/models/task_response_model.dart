
import 'dart:convert';

class TaskResponsModel {
    final List<Task> data;

    TaskResponsModel({
        required this.data,
    });

    factory TaskResponsModel.fromJson(String str) => TaskResponsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TaskResponsModel.fromMap(Map<String, dynamic> json) => TaskResponsModel(
        data: List<Task>.from(json["data"].map((x) => Task.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Task {
    final String id;
    final Attributes attributes;

    Task({
        required this.id,
        required this.attributes,
    });

    factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Task.fromMap(Map<String, dynamic> json) => Task(
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
    final int v;

    Attributes({
        required this.title,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}
