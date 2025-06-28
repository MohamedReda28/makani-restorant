
import 'package:makani/core/models/reviewPoductModel.dart';
import '../entitys/ProductEntity.dart';
import '../helpes_function/getAvgReting.dart';

class ProductModel {
  final String pID;
  final String name;
  final String description;
  final String code;
  final String catogry;
  final num price;
  //final File image;
  final bool isFeature;
  String? imageUrl;
  final num numberOfCaloric;
  final String unitAmount;
   final double avgReting;
  final int ratigCount;
  final int sellingcount;
  final bool isOrgnic;
  final List<ReviewporductModel> reviews;

  ProductModel(
      {required this.catogry,
        required this.pID,
       required  this.avgReting,
      required this.ratigCount,
      required this.numberOfCaloric,
      required this.unitAmount,
      required this.name,
      required this.description,
      required this.code,
      required this.sellingcount,
      this.isOrgnic = false,
      required this.price,
      // required this.image,
      required this.isFeature,
       required this.reviews,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      pID:json['pId'] ,
      description: json['description'],
      ratigCount :json['ratigCount'],
      code: json['code'],
      price: json['price'],
      //image: File(json['image']),
      isFeature: json['isFeature'],
      catogry: json['catogry'],
      numberOfCaloric: json['numberOfCaloric'],
      isOrgnic: json['isOrgnic'],
      imageUrl: json['imageUrl'],
      sellingcount: json['sellingcount'],
      unitAmount: json['unitAmount'] != null ? json['unitAmount'] : '0',
      reviews: json['reviews'] != null
          ? List<ReviewporductModel>.from(
                  json['reviews'].map((x) => ReviewporductModel.fromJson(x))) : [],
      //avgReting: getAvgReting(json['reviews'])!= null ? getAvgReting(json['reviews']) : 0.0,
      avgReting: json['avgReting'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      code: code,
      price: price,
      pID :pID,
      //image: image,
      ratigCount: reviews.length,
      isFeature: isFeature,
      avgReting:getAvgReting(reviews),
      catogry: catogry,
      numberOfCaloric: numberOfCaloric,
      unitAmount: unitAmount,
      isOrgnic: isOrgnic,
      imageUrl: imageUrl,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'isFeature': isFeature,
      'imageUrl': imageUrl,
      'catogry': catogry,
      'ratigCount' : ratigCount,
      'numberOfCaloric': numberOfCaloric,
      'unitAmount': unitAmount,
      'sellingcount': sellingcount,
      'isOrgnic': isOrgnic,
       'reviews': reviews.map((e) => e.toMap()).toList(),
    };
  }
  static double getAvgReting(List<ReviewporductModel> reviews) {
    if (reviews.isEmpty) return 0.0;
    final total = reviews.fold<double>(0.0, (sum, r) => sum + r.ratting);
    return double.parse((total / reviews.length).toStringAsFixed(1));
  }
}
