import '../../../core/app_export.dart';

class MyProductsModel {
  final int id;
  final String name;
  final String mainImageUrl;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final String propertyTypeName;
  final String providerName;
  final String providerIconUrl;
  final String locationName;
  final int channel;

  MyProductsModel({
    required this.id,
    required this.name,
    required this.mainImageUrl,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.propertyTypeName,
    required this.providerName,
    required this.providerIconUrl,
    required this.locationName,
    required this.channel,
  });

  // From JSON to MyProductsModel
  factory MyProductsModel.fromJson(Map<String, dynamic> json) {
    return MyProductsModel(
      id: json['id'] ?? 0,
      name: json['name'],
      mainImageUrl: json['mainImageUrl'] ?? ImageConstant.imageEyeClosed,
      price: json['price'] ?? 0,
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      propertyTypeName: json['propertyTypeName'],
      providerName: json['provider']['name'] ?? '',
      providerIconUrl: json['provider']['iconUrl'] ?? '',
      locationName: json['location']['name'] ?? '',
      channel: json['channel'],
    );
  }
}
