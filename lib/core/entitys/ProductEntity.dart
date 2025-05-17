
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final String code;
  final num price;
  // final File image;
  final bool isFeature;
  String? imageUrl;
  final String catogry;
  final num numberOfCaloric;
  final String unitAmount;
  // final num avgReting;
  final num ratigCount = 0;
  final bool isOrgnic;
  //final List<ReviewporductEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.catogry,
      //  required this.avgReting,
      // required this.reviews,
      required this.numberOfCaloric,
      required this.unitAmount,
      required this.description,
      required this.code,
      required this.price,
      //required this.image,
      required this.isFeature,
      this.isOrgnic = false,
      this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
