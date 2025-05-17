import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../constsns.dart';
import '../../../../../core/Widghts/CustomAppbar2.dart';
import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/cubits/product_cubit/product_cubit_cubit.dart';
import '../../../../../core/helpes_function/git_dammy_Product.dart';
import '../../../../Searchview/SearchView.dart';
import 'CustomCategory.dart';
import 'CustomTextFiledForSearch.dart';
import 'ListCustomcategory.dart';
import 'ProductsGridview.dart';
import 'ProdutviewResult.dart';

class ProdutViewBody extends StatefulWidget {
  const ProdutViewBody({super.key});

  @override
  State<ProdutViewBody> createState() => _ProdutViewBodyState();
}

class _ProdutViewBodyState extends State<ProdutViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: kTopPadding),
                    const CustomAppbar2(
                      title: 'المنتجات',
                      visableArw: false,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFiledForSearch(
                      ontap: () {
                        Navigator.of(context).pushNamed(Searchview.routeName);
                      },
                    ),
                    const SizedBox(height: 12),
                    if (state is ProductCubitSuccess)
                      ProdutviewResult(
                        productleanth: state.productLength!,
                        contextt: context,
                      ),
                    const SizedBox(height: 12),
                    const ListCustomcategory(),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              if (state is ProductCubitLoading) ...[
                Skeletonizer.sliver(
                  enabled: true,
                  child: ProductsGridview(
                    products: getDomyProducts(),
                  ),
                ),
              ] else if (state is ProductCubitSuccess) ...[
                ProductsGridview(
                  products: state.products,
                ),
              ] else if (state is ProductCubitFailure) ...[
                SliverToBoxAdapter(
                  child: Customerrorwidght(
                    text: state.message,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
