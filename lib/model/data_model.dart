// To parse this JSON data, do
//
//     final dataListModel = dataListModelFromJson(jsonString);

import 'dart:convert';

DataListModel dataListModelFromJson(String str) => DataListModel.fromJson(json.decode(str));

String dataListModelToJson(DataListModel data) => json.encode(data.toJson());

class DataListModel {
    int count;
    dynamic next;
    dynamic previous;
    List<Result> results;

    DataListModel({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory DataListModel.fromJson(Map<String, dynamic> json) => DataListModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    int id;
    String name;
    String? image;
    bool isActive;
    DateTime createdAt;

    Result({
        required this.id,
        required this.name,
        required this.image,
        required this.isActive,
        required this.createdAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
    };
}
