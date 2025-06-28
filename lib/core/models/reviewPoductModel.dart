import 'package:intl/intl.dart';

import '../entitys/reviewPorductEntity.dart';

class ReviewporductModel {
  final String name;
  final String revdescription;
  final String image;
  final String date;
  final double ratting;

  ReviewporductModel({
    required this.name,
    required this.revdescription,
    required this.image,
    required this.date,
    required this.ratting,
  });

  factory ReviewporductModel.fromEntity(
      ReviewporductEntity reviewporductEntity) {
    return ReviewporductModel(
      name: reviewporductEntity.name,
      revdescription: reviewporductEntity.revdescription,
      image: reviewporductEntity.image,
      ratting: reviewporductEntity.ratting,
      date: DateFormat('yyyy-MM-dd HH:mm', 'en').format(DateTime.now()),
    );
  }
  factory ReviewporductModel.fromJson(Map<String, dynamic> json) {
    return ReviewporductModel(
      name: json['name'],
      revdescription: json['revdescription'],
      image: json['image'],
      date: json['date'],
      ratting: json['ratting'],
    );
  }
  ReviewporductEntity toEntity() {
    return ReviewporductEntity(
      name: name,
      revdescription: revdescription,
      image: image,
      ratting: ratting,
      data: date,
    );
  }

  toMap() {
    return {
      'name': name,
      'revdescription': revdescription,
      'image': image,
      'date':  date,
      'ratting': ratting,
    };
  }
}
