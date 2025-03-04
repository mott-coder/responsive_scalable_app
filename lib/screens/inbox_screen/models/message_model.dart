class MessageModel {
  String? message;
  DateTime? dateCreated;
  String? email;
  String? name;
  String? phone;
  String? property; //property name

  MessageModel({
    this.message,
    this.dateCreated,
    this.email,
    this.name,
    this.phone,
    this.property,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] ?? '',
      dateCreated: DateTime.parse(json['dateCreated']),
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      property: json['property'] ?? '',
    );
  }
}
