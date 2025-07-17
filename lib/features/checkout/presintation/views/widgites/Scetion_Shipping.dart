import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constsns.dart';
import '../../../domines/entitys/Order_Entity.dart';
import 'Shipping_Item.dart';

class ScetionShipping extends StatefulWidget {
  const ScetionShipping({super.key});

  @override
  State<ScetionShipping> createState() => _ScetionShippingState();
}

class _ScetionShippingState extends State<ScetionShipping>
    with AutomaticKeepAliveClientMixin {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(
          height: 33,
        ),
        ShippingItem(
          isselected: selectindex == 1,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${(context.read<OrderInputEntity>().cartList.CalculteTotlePrice())}',
          ontap: () {
            selectindex = 1;
            context.read<OrderInputEntity>().paywithCash = true;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          ontap: () {
            selectindex = 2;
            context.read<OrderInputEntity>().paywithCash = false;
            setState(() {});
          },
          isselected: selectindex == 2,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: '${context.read<OrderInputEntity>().cartList.CalculteTotlePrice()}',
          enabled: false, // <-- هنا بنخليها مش مفعلة
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
