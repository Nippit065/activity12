import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.id,
        required this.foods,
        required this.quantities,
        required this.totalPrice,
    });

    String id;
    List<String> foods;
    List<int> quantities;
    int totalPrice;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        foods: List<String>.from(json["foods"].map((x) => x)),
        quantities: List<int>.from(json["quantities"].map((x) => x)),
        totalPrice: json["totalPrice"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "quantities": List<dynamic>.from(quantities.map((x) => x)),
        "totalPrice": totalPrice,
    };
}
