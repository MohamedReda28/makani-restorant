import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/core/services/services/CustomBlocObserver.dart';
import 'package:makani/core/uitels/App_TextStyle.dart';
import 'package:makani/features/Searchview/peresentation/views/maneger/cubit/search_product_cubit.dart';

import '../../../../../constsns.dart';
import 'CustomTextFormFieldOnChenge.dart';
import 'SearchProductsGridviewBlocBuilder.dart';

class SearchviewBody extends StatelessWidget {
  const SearchviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(
                height: kTopPadding,
              ),
              Customtextformfieldonchenge(
                onChange: (value) {
                  context
                      .read<SearchProductCubit>()
                      .searchProductsByName(productName: value!);
                },
                hinttext: 'ابحث عن.......',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'نتائج البحث ',
                textAlign: TextAlign.center,
                style: AppStyle.regular13.copyWith(color: Color(0xFF949D9E)),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
        const SearchProductsGridviewBlocBuilder(),
      ],
    );
  }
}
