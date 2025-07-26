import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';
part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit(this.productRepo) : super(SearchProductInitial());
  final ProductRepo productRepo;


  Future<void> searchProductsByName({required String productName}) async {
    if (productName.trim().isEmpty) {
      emit(SearchProductInitial()); // فقط لو المستخدم مسح البحث
      return;
    }

    final result =
        await productRepo.searchProductsByName(productName: productName);

    result.fold(
      (failure) => emit(SearchProductFaluir(errorMessage: failure.message)),
      (products) => emit(SearchProductSuccess(products: products)),
    );
  }
}
