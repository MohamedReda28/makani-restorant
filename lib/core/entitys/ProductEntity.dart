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
      required this.unitAmount,
      required this.description,
      required this.code,
      required this.price,
      //required this.image,
      required this.isFeature,
      this.isOrgnic = false,
      this.imageUrl});


  ProductEntity copyWith({
    String? name,
    String? pID,
    String? description,
    String? code,
    num? price,
    bool? isFeature,
    String? imageUrl,
    String? catogry,
    String? unitAmount,
    double? avgReting,
    int? ratigCount,
    bool? isOrgnic,
    List<ReviewporductEntity>? reviews,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      pID: pID ?? this.pID,
      description: description ?? this.description,
      code: code ?? this.code,
      price: price ?? this.price,
      isFeature: isFeature ?? this.isFeature,
      imageUrl: imageUrl ?? this.imageUrl,
      catogry: catogry ?? this.catogry,
      unitAmount: unitAmount ?? this.unitAmount,
      avgReting: avgReting ?? this.avgReting,
      ratigCount: ratigCount ?? this.ratigCount,
      isOrgnic: isOrgnic ?? this.isOrgnic,
      reviews: reviews ?? this.reviews,
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
