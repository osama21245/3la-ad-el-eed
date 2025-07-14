class Shop {
  final String? id;
  final String? image;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String category;
  final String description;

  Shop( {
    required this.id,
    required this.image,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    required this.category,
    required this.description
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(

      image: json['image'],
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
        website: json['website'],
      category: json['category'],
        description: json['description']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image' : image,
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      'category':category,
      'description': description,
    };
  }
}
