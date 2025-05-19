import 'package:makani/features/myorders/domins/entitys/order%20entity.dart';

import '../../features/myorders/data/models/order model.dart';

 DisplayOrderEntity  getdammyOrder(){
   return DisplayOrderEntity(
     totalPrice: 1500.75,
     uID: 'user_123',
     oID: 'order_456',
     numoforders: 3,
     status: 'جاري المعالجة',
     date: '2025-05-18',
   );
 }

List<DisplayOrderEntity> getdammyOrders() {
  return [
    getdammyOrder(),
    getdammyOrder(),
    getdammyOrder(),
    getdammyOrder(),
    getdammyOrder(),
  ];
}