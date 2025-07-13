import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/Home/peresntation/views/HomeView.dart';
import 'package:makani/features/Home/peresntation/views/mainView.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import '../../cubits/cart/cart_cubit_cubit.dart';
import 'CartItemList.dart';
import 'CastomCartBotton.dart';
import 'MassegeInCard.dart';

class Cartviewboby extends StatelessWidget {
  const Cartviewboby({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: kTopPadding,
                ),
                CustomAppbar2(
                  title: 'السلة',
                  visableicon: false,
                  onTap: (){
                    Navigator.pushReplacementNamed(context, MainView.routeName);
                  },

                ),
                const SizedBox(
                  height: 16,
                ),
                const Massegeincard(),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Cartitemlist(
              cartitems: context.watch<CartCubit>().cartEntity.carsItems),
        ],
      ),
      Positioned(
          left: 15,
          right: 15,
          bottom: MediaQuery.sizeOf(context).height * 0.06,
          child: const CastomCartBotton()),
    ]);
  }
}
