class Shop {
  final String? id;
  final String? userID;
  final int? requestStatus;
  final String? shopImage;
  final String? nationalIDImage;
  final String? commercialRegistrationCertificateImage;
  final String? taxIdentificationCertificateImage;
  final String? businessLicenseImage;
  final String? bankAccountDetailsImage;
  final String? adminRejectionReasonMessage;
  final String? category;

  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String description;
  final String shopPassword;

  Shop({
    required this.userID,
    required this.name,
    required this.website,
    required this.description,
    required this.shopPassword,
    required this.address,
    required this.phone,
    required this.email,
    required this.category,
    required this.adminRejectionReasonMessage,
    required this.id,
    required this.requestStatus,
    required this.shopImage,
    required this.nationalIDImage,
    required this.commercialRegistrationCertificateImage,
    required this.taxIdentificationCertificateImage,
    required this.businessLicenseImage,
    required this.bankAccountDetailsImage,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      userID: json['userID'],
      adminRejectionReasonMessage: json['adminRejectionReasonMessage'],
      requestStatus: json['requestStatus'],
      bankAccountDetailsImage: json['bankAccountDetailsImage'],
      businessLicenseImage: json['commercialRegistrationCertificateImage'],
      commercialRegistrationCertificateImage:json['commercialRegistrationCertificateImage'],
      taxIdentificationCertificateImage:json['taxIdentificationCertificateImage'],
      nationalIDImage: json['nationalIDImage'],
      shopImage: json['shopImage'],
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      category: json['category'],
      description: json['description'],
      shopPassword: json['shopPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'requestStatus': requestStatus,
      'adminRejectionReasonMessage': adminRejectionReasonMessage,
      'shopImage': shopImage,
      'nationalIDImage': nationalIDImage,
      'taxIdentificationCertificateImage': taxIdentificationCertificateImage,
      'commercialRegistrationCertificateImage':commercialRegistrationCertificateImage,
      'businessLicenseImage': businessLicenseImage,
      'bankAccountDetailsImage': bankAccountDetailsImage,
      'shopPassword': shopPassword,
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      'category': category,
      'description': description,
    };
  }
}
