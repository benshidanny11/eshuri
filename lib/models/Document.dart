import 'package:flutter/material.dart';

class Document {
  String id;
  String ownerName;
  String? ownerPhone;
  String finderName;
  String finderPhone;
  String image;
  String? documentId;
  String documentType;
  String description;
  String userId;
  DateTime createdAt;

  Document({
    required this.id,
    required this.finderName,
    required this.finderPhone,
    required this.image,
    required this.description,
    this.documentId,
    required this.ownerName,
    required this.documentType,
    this.ownerPhone,
    required this.userId,
    required this.createdAt,
  });





    Map<String, dynamic> toJson() => {
        'id': id,
        'finderName': finderName,
        'ownerName': ownerName,
        'serviceType': documentType,
        'image': image,
        'description': description,
        'documentId': documentId,
        'documentType': documentType,
        'ownerPhone': ownerPhone,
        'userId': userId,
        'createdAt': createdAt
      };

      static Document fromJSON(json) => Document(
        id: json['id'],
        finderName: json['finderName'],
        ownerName: json['ownerName'],
        image: json['image'],
        description: json['description'],
        documentId: json['documentId'],
        documentType: json['documentType'],
        ownerPhone: json['ownerPhone'],
        userId: json['userId'],
        createdAt: json['createdAt'], 
        finderPhone: json['finderPhone'],

      );
}
