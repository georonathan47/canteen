// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Users {
    Users({
        @required this.data,
    });

    final List<Datum> data;

    factory Users.fromRawJson(String str) => Users.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        @required this.id,
        @required this.name,
        @required this.order,
        @required this.email,
        @required this.password,
        @required this.rememberToken,
        @required this.emailVerifiedAt,
    });

    final int id;
    final String name;
    final Order order;
    final String email;
    final String password;
    final String rememberToken;
    final DateTime emailVerifiedAt;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        order: Order.fromJson(json["order"]),
        email: json["email"],
        password: json["password"],
        rememberToken: json["remember_token"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "order": order.toJson(),
        "email": email,
        "password": password,
        "remember_token": rememberToken,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
    };
}

class Order {
    Order({
        @required this.id,
        @required this.userId,
        @required this.orderNo,
        @required this.paymentType,
        @required this.orderDetails,
        @required this.transaction,
        @required this.status,
    });

    final int id;
    final String userId;
    final String orderNo;
    final String paymentType;
    final List<OrderDetail> orderDetails;
    final Transaction transaction;
    final String status;

    factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        orderNo: json["order_no"],
        paymentType: json["payment_type"],
        orderDetails: List<OrderDetail>.from(json["order_details"].map((x) => OrderDetail.fromJson(x))),
        transaction: Transaction.fromJson(json["transaction"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_no": orderNo,
        "payment_type": paymentType,
        "order_details": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "transaction": transaction.toJson(),
        "status": status,
    };
}

class OrderDetail {
    OrderDetail({
        @required this.id,
        @required this.orderId,
        @required this.foodId,
        @required this.food,
        @required this.foodPrice,
        @required this.qty,
        @required this.totalAmt,
    });

    final int id;
    final String orderId;
    final String foodId;
    final Food food;
    final String foodPrice;
    final String qty;
    final String totalAmt;

    factory OrderDetail.fromRawJson(String str) => OrderDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        food: Food.fromJson(json["food"]),
        foodPrice: json["food_price"],
        qty: json["qty"],
        totalAmt: json["total_amt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "food_id": foodId,
        "food": food.toJson(),
        "food_price": foodPrice,
        "qty": qty,
        "total_amt": totalAmt,
    };
}

class Food {
    Food({
        @required this.id,
        @required this.foodName,
        @required this.image,
        @required this.price,
        @required this.description,
        @required this.status,
        @required this.createdAt,
        @required this.updatedAt,
    });

    final int id;
    final String foodName;
    final String image;
    final String price;
    final String description;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Food.fromRawJson(String str) => Food.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodName: json["food_name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "food_name": foodName,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Transaction {
    Transaction({
        @required this.id,
        @required this.userId,
        @required this.orderId,
        @required this.paymentType,
        @required this.status,
        @required this.content,
    });

    final int id;
    final String userId;
    final String orderId;
    final String paymentType;
    final String status;
    final String content;

    factory Transaction.fromRawJson(String str) => Transaction.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        paymentType: json["payment_type"],
        status: json["status"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "payment_type": paymentType,
        "status": status,
        "content": content,
    };
}
