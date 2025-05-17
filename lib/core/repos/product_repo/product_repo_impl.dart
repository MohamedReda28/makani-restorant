import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';
import '../../entitys/ProductEntity.dart';
import '../../erroes/Failur.dart';
import '../../models/productModel.dart';
import '../../services/services/DataBase_Serveces.dart';
import '../../uitels/backend Impoint.dart';


class productRepoImpl implements ProductRepo {
  final DataBaseServeces dataBaseServeces;
  productRepoImpl({required this.dataBaseServeces});
  @override
  Future<Either<Failur, List<ProductEntity>>> getSomeBestSellingProduct() async {
    try {
      var data = await dataBaseServeces
          .getData(path: BackEndImpoint.getproducts, query: {
        'limit': 2,
        'orderBy': 'sellingcount',
        'descending': true,
      }) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit =
          products.map((e) => e.toEntity()).toList();
      return right(productEntit);
    } catch (e) {
       log(e.toString());
      return left(
       
        ServerFailure('Failed to load products'));
    }
  }

  Future<Either<Failur, List<ProductEntity>>> getAllBestSellingProduct() async {
    try {
      var data = await dataBaseServeces
          .getData(path: BackEndImpoint.getproducts, query: {
        'limit': 5,
        'orderBy': 'sellingcount',
        'descending': true,
      }) as List<Map<String, dynamic>>;

      List<ProductModel> products =
      data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit =
      products.map((e) => e.toEntity()).toList();
      return right(productEntit);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }

  @override
  Future<Either<Failur, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseServeces.getData(
          path: BackEndImpoint.getproducts) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit =
          products.map((e) => e.toEntity()).toList();
      return right(productEntit);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }

  Future<Either<Failur, List<ProductEntity>>> searchProductsByName(
      {required String productName}) async {
    try {
      if (productName.isEmpty) {
        return left(ServerFailure('Product name can’t be empty'));
      }

      var query = {
        'searchField': 'name',
        'keyword': productName,
        'limit': 20, // ممكن تغير العدد حسب الحاجة
      };

      var data = await dataBaseServeces.getData(
        path: BackEndImpoint.getproducts,
        query: query,
      ) as List<Map<String, dynamic>>;

      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit = products.map((e) => e.toEntity()).toList();

      return right(productEntit);
    } catch (e) {
      return left(ServerFailure('Failed to search products'));
    }
  }

  @override
  Future<Either<Failur, List<ProductEntity>>> getProductsOrderBy({required String sortOption}) async{
   try{
     var data =await dataBaseServeces.getData(path: BackEndImpoint.getproducts,query: {
       'sortOption': sortOption,
     }) as List<Map<String, dynamic>>;
     List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
     List<ProductEntity> productEntit = products.map((e) => e.toEntity()).toList();

     return right(productEntit);
   }catch (e) {
     return left(ServerFailure('Failed to load products'));
   }
  }

  @override
  Future<Either<Failur, List<ProductEntity>>> getProductsByCAtogry({required String catogry})async {
    try{
      var data =await dataBaseServeces.getData(path: BackEndImpoint.getproducts,query: {
        'categoryField': 'catogry',
        'categoryValue': catogry,
      }) as List<Map<String, dynamic>>;
      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntit = products.map((e) => e.toEntity()).toList();

      return right(productEntit);
    }catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }



}
