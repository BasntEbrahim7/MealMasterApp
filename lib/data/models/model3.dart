// To parse this JSON data, do
// list by categories
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Meal> Recipes;

  Welcome({
    required this.Recipes,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    Recipes: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(Recipes.map((x) => x.toJson())),
  };
}

class Meal {
  String strCategory;

  Meal({
    required this.strCategory,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strCategory: json["strCategory"],
  );

  Map<String, dynamic> toJson() => {
    "strCategory": strCategory,
  };
}
