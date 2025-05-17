import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makani/features/Searchview/peresentation/views/maneger/cubit/search_product_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/Widghts/customErrorWidght.dart';
import '../../../../../core/helpes_function/git_dammy_Product.dart';
import '../../../../../core/uitels/app_images.dart';
import '../../../../Home/peresntation/views/widgets/ProductsGridview.dart';
import 'SearchProductInitialWidget.dart';
import 'SearchProductSuccessWidget.dart';
import 'SearchproductLoadingwidget.dart';

class SearchProductsGridviewBlocBuilder extends StatelessWidget {
  const SearchProductsGridviewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
      if (state is SearchProductInitial) {
        // لو المستخدم ما كتبش حاجة
        return const Searchproductinitialwidget();
      }
      if (state is SearchProductSuccess) {
        if(state.products.isEmpty){
          return const Searchproductsuccesswidget();
        }
        else{
          return ProductsGridview(products: state.products);
        }
      } else if (state is SearchProductFaluir) {
        return Customerrorwidght(
          text: state.errorMessage,
        );
      } else {
        return const Searchproductloadingwidget();
      }
    });
  }
}

