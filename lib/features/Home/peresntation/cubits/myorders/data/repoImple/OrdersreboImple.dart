
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:makani/core/erroes/Failur.dart';
import 'package:makani/core/services/services/DataBase_Serveces.dart';
import 'package:makani/core/uitels/backend%20Impoint.dart';
import '../../domins/entitys/order entity.dart';
import '../../domins/repo/orderRebo.dart';
import '../models/order model.dart';


class OrdersrepoImple extends Ordersrebo{
  final DataBaseServeces dataBaseServeces;

  OrdersrepoImple({required this.dataBaseServeces});
  @override
  Future<Either<Failur, List<DisplayOrderEntity>>> getOrders(String uID) async{
    try{
      var data =await dataBaseServeces.getData(path: BackEndImpoint.getOrders,query: {
        'categoryField': 'uID',
        'categoryValue': uID,
      }) as List<Map<String, dynamic>>;
      List<DisplayOrderModel> products = data.map((e) => DisplayOrderModel.fromJson(e)).toList();
      List<DisplayOrderEntity> productEntit = products.map((e) => e.toEntity()).toList();

      return right(productEntit);
    }catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
    
  }
  
}