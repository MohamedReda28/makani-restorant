import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makani/core/entitys/ProductEntity.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';

part 'get_reviews_state.dart';

class GetReviewsCubit extends Cubit<GetReviewsState> {
  GetReviewsCubit(this.productRepo) : super(GetReviewsInitial());
  final ProductRepo productRepo;
  Future<void> getReviews({required String productId}) async {
    emit(GetReviewsLoading());
    var result = await productRepo.getReviews(productId: productId);
    result.fold((faluir) => emit(GetReviewsFaluir(faluir.message)),
        (products) => emit(GetReviewsSuccess(products)));
  }
}
