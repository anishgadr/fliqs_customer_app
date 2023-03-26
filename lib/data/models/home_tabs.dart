// To parse this JSON data, do
//
//     final homeTab = homeTabFromJson(jsonString);

import 'dart:convert';

HomeTab homeTabFromJson(String str) => HomeTab.fromJson(json.decode(str));

String homeTabToJson(HomeTab data) => json.encode(data.toJson());

class HomeTab {
  HomeTab({
    this.homeTab,
  });

  List<HomeTabElement>? homeTab;

  factory HomeTab.fromJson(Map<String, dynamic> json) => HomeTab(
        homeTab: json["home_tab"] == null
            ? []
            : List<HomeTabElement>.from(
                json["home_tab"]!.map((x) => HomeTabElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_tab": homeTab == null
            ? []
            : List<dynamic>.from(homeTab!.map((x) => x.toJson())),
      };
}

class HomeTabElement {
  HomeTabElement({
    this.tab,
  });

  String? tab;

  factory HomeTabElement.fromJson(Map<String, dynamic> json) => HomeTabElement(
        tab: json["tab"],
      );

  Map<String, dynamic> toJson() => {
        "tab": tab,
      };
}
