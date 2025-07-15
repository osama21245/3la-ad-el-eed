class ShopRequestModel {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? website;
  final String? description;
  final String? categoryType;

  ShopRequestModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.website,
    required this.description,
    required this.categoryType,
  });
  factory ShopRequestModel.fromJson(Map<String, dynamic> json) {
    return ShopRequestModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      website: json['website'] as String?,
      description: json['description'] as String?,
      categoryType: json['categoryType'] as String?,
    );
    }

    Map<String, dynamic> toJson(ShopRequestModel shopModel) {
      return {
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'website': website,
        'description': description,
        'categoryType': categoryType,
      };
    }
  
}