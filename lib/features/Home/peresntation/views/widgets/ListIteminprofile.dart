import 'package:flutter/material.dart';
import 'package:makani/features/Home/peresntation/views/widgets/who%20_our.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../data/Models/ItemProfileModel.dart';
import '../../cubits/myorders/presintation/view/myorderview.dart';
import 'ItemInProfile.dart';

class ListIteminprofile extends StatelessWidget {
  const ListIteminprofile({super.key});
  @override
  Widget build(BuildContext context) {
    final List<ItemProfileModel> items = [
      ItemProfileModel(
          icon: Assets.imagesPerson2, tittle: 'الملف الشخصي', onTap: () {}),
      ItemProfileModel(icon: Assets.imagesBox, tittle: 'طلباتي', onTap: () {
        Navigator.pushNamed(context, Myorderview.routeName);
      }),
      ItemProfileModel(
          icon: Assets.imagesWallet, tittle: 'المدفوعات', onTap: () {}),
      ItemProfileModel(
          icon: Assets.imagesHeart2, tittle: 'المفضلة', onTap: () {}),
      ItemProfileModel(
          icon: Assets.imagesOurwho, tittle: 'من نحن', onTap: () {
        Navigator.pushNamed(context, WhoOur.routeName);

      }),
    ];
    return SliverList.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => Iteminprofile(
        itemProfileModel: items[index],
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1,
        color: Color(0xFFF2F3F3),
        height: 40,
      ),
    );
  }
}
