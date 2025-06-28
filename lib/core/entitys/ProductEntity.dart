import 'package:equatable/equatable.dart';
import 'package:makani/core/entitys/reviewPorductEntity.dart';

class ProductEntity extends Equatable {
  final String name;
  final String pID;
  final String description;
  final String code;
  final num price;
  // final File image;
  final bool isFeature;
  String? imageUrl;
  final String catogry;
  final num numberOfCaloric;
  final String unitAmount;
  final double avgReting;
  final int ratigCount;
  final bool isOrgnic;
  final List<ReviewporductEntity> reviews;

  ProductEntity(
      {required this.name,
        required this.pID,
      required this.ratigCount,
      required this.catogry,
      required this.avgReting,
      required this.reviews,
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
