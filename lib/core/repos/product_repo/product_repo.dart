import 'package:dartz/dartz.dart';

import '../../entitys/ProductEntity.dart';
import '../../entitys/reviewPorductEntity.dart';
import '../../erroes/Failur.dart';


abstract class ProductRepo {
  Future<Either<Failur, List<ProductEntity>>> getProducts();
  Future<Either<Failur, List<ProductEntity>>> getSomeBestSellingProduct();
  Future<Either<Failur, List<ProductEntity>>> getAllBestSellingProduct();
  Future<Either<Failur, List<ProductEntity>>> searchProductsByName(
      {required String productName});
  Future<Either<Failur, List<ProductEntity>>> getProductsOrderBy(
      {required String sortOption});

  Future<Either<Failur, List<ProductEntity>>> getProductsByCAtogry(
      {required String catogry});
  Future<Either<Failur, void>>addReview(
      {required ReviewporductEntity reviewporductEntity ,required String path,required String productId});

  Future<Either<Failur,ProductEntity>>getReviews({required String productId});
}


