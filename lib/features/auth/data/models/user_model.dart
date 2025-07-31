class UserModel {
  final String id;
  final String name;
  final String email;
  final int isSeller;
  final int is_send_shop_request;

  // Optional, if needed for some operations
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isSeller,
    required this.is_send_shop_request,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      isSeller: json['isSeller'] as int? ?? 0,
      is_send_shop_request:
          json['is_send_shop_request'] as int? ??
          0, // Default to 0 if not provided
    );
  }

  Map<String, dynamic> toJson(UserModel user) {
    return {'id': id, 'name': name, 'email': email, 'isSeller': isSeller};
  }
}
