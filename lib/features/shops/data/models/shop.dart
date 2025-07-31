class Shop {
 add_product
  final String id;

 add_shop
  final String? id;
  final String? userID;
  final int? requestStatus;
  final String? shopImage;
  final String? nationalIDImage;
  final String? commercialRegistrationCertificateImage;
  final String? taxIdentificationCertificateImage;
  final String? businessLicenseImage;
  final String? bankAccountDetailsImage;

  final String id;
 development
 development
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
 add_product

  Shop({
    required this.id,

 add_shop
  final String category;
  final String description;
  final String shopPassword;
  final String? adminRejectionReasonMessage;

  Shop( {
    required this.userID,
    required this.adminRejectionReasonMessage,
    required this.id,
    required this.requestStatus,
    required this.shopImage,
    required this.nationalIDImage,
    required this.commercialRegistrationCertificateImage,
    required this.taxIdentificationCertificateImage,
    required this.businessLicenseImage,
    required this.bankAccountDetailsImage,

  Shop({
    required this.id,
 development
 development
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
 add_product

 add_shop
    required this.category,
    required this.description,
    required this.shopPassword

 development
 development
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
 add_product

 add_shop
        userID:json['userID'],
        adminRejectionReasonMessage:json['adminRejectionReasonMessage'] ,
        requestStatus: json['requestStatus'],
        bankAccountDetailsImage: json['bankAccountDetailsImage'],
        businessLicenseImage: json['commercialRegistrationCertificateImage'],
        commercialRegistrationCertificateImage: json['commercialRegistrationCertificateImage'],
        taxIdentificationCertificateImage: json['taxIdentificationCertificateImage'],
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
        shopPassword: json['shopPassword']

 development
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
 add_product

 development
 development
    );
  }

  Map<String, dynamic> toJson() {
    return {
 add_product

 add_shop
      'userID':userID,
      'requestStatus': requestStatus ,
      'adminRejectionReasonMessage' : adminRejectionReasonMessage,
      'shopImage': shopImage,
      'nationalIDImage': nationalIDImage,
      'taxIdentificationCertificateImage': taxIdentificationCertificateImage,
      'commercialRegistrationCertificateImage': commercialRegistrationCertificateImage,
      'businessLicenseImage': businessLicenseImage,
      'bankAccountDetailsImage': bankAccountDetailsImage,
      'shopPassword' : shopPassword,

 development
 development
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
 add_product

 add_shop
      'category':category,
      'description': description,

 development
 development
    };
  }
}
