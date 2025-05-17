import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constsns.dart';
import '../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../auth/peresentation/views/Views/Best Salling view.dart';
import '../../../../Searchview/SearchView.dart';
import 'CustomBestSalar.dart';
import 'CustomTextFiledForSearch.dart';
import 'Custom_Home_Appbar.dart';
import 'ListFeatureItem.dart';
import 'ProductsGridviewBlocBuilder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getSomeBestSellingProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: kTopPadding,
                ),
                const CustomHomeAppbar(),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFiledForSearch(
                  ontap: () {
                    Navigator.of(context).pushNamed(Searchview.routeName);
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                const ListfeatureitemFeature(),
                const SizedBox(
                  height: 7,
                ),
                Custombestsalar(
                  ontap: () {
                    Navigator.of(context).pushNamed(BestSallingView.routeName);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProductsGridviewBlocBuilder(),
        ],
      ),
    );
  }
}
