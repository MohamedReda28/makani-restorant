import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makani/core/repos/product_repo/product_repo.dart';

import '../../../../../core/entitys/reviewPorductEntity.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.productRepo) : super(ReviewInitial());
  final ProductRepo productRepo;

  Future<void> addReview(
      ReviewporductEntity reviewporductEntity, String productId, {required String path}) async {
    emit(ReviewLoading());
    var result = await productRepo.addReview(
        reviewporductEntity: reviewporductEntity, productId: productId,  path: path);
    result.fold(
      (l) => emit(
        ReviewFaluir(l.message),
      ),
      (r) => emit(
        ReviewSuccesss(),
      ),
    );
  }




}
