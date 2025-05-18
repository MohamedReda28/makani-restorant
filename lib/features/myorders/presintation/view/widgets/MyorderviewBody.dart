import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constsns.dart';
import 'ItemDisplayMyOrder.dart';

class Myorderviewbody extends StatelessWidget {
  const Myorderviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorsintalPadding),
      child: Column(
        children: [
          SizedBox(height:kTopPadding.h ,),
          const Itemdisplaymyorder(),
          SizedBox(height: 12.h,),
          const Itemdisplaymyorder(),
          SizedBox(height: 12.h,),
          const Itemdisplaymyorder(),
          SizedBox(height: 12.h,),
          const Itemdisplaymyorder(),

        ],
      ),
    );
  }
}
