class House {
  String id;
  String location;
  String serviceType;
  String houseMode;
  double price;
  String image;
  String description;
  House(
      {required this.id,
      required this.location,
      required this.description,
      required this.houseMode,
      required this.image,
      required this.price,
      required this.serviceType});

  Map<String, dynamic> toJson() => {
        'id': id,
        'location': location,
        'description': description,
        'houseMode': houseMode,
        'image': image,
        'price': price,
        'serviceType': serviceType,
      };

  static House fromJson(json) => House(
      id: json['id'],
      location: json['location'],
      description: json['description'],
      houseMode: json['houseMode'],
      image: json['image'],
      price: json['price'],
      serviceType: json['serviceType']);
}
