class Car {
  String id;
  String model;
  String image;
  String color;
  String serviceType;
  double price;
  double discount;
  String description;
  Map<String, dynamic> rating;
  String userId;
  DateTime createdAt;

  Car(
      {required this.id,
      required this.model,
      required this.serviceType,
      required this.image,
      required this.price,
      required this.discount,
      required this.description,
      required this.rating,
      required this.userId,
      required this.color,
      required this.createdAt});

  Map<String, dynamic> toJson() => {
        'id': id,
        'model': model,
        'serviceType': serviceType,
        'image': image,
        'price': price,
        'discount': discount,
        'description': description,
        'rating': rating,
        'color': color,
        'userId': userId,
        'createdAt': createdAt
      };

  static Car fromJson(json) => Car(
      id: json['id'],
      model: json['model'],
      serviceType: json['serviceType'],
      image: json['image'],
      price: json['price'],
      discount: json['discount'],
      description: json['description'],
      rating: json['rating'],
      userId: json['userId'],
      color: json['color'],
      createdAt: json['createdAt']);
}
