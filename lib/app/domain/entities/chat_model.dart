import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String? id;
  String? name;
  String message;
  ChatModel({
    this.id,
    this.name,
    required this.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        name: json["name"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
      };
}
