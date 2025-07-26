part of 'get_reviews_cubit.dart';

sealed class GetReviewsState extends Equatable {
  const GetReviewsState();

  @override
  List<Object> get props => [];
}

final class GetReviewsInitial extends GetReviewsState {}
final class GetReviewsLoading extends GetReviewsState {}
final class GetReviewsSuccess extends GetReviewsState {
  final ProductEntity productEntity;

  GetReviewsSuccess(this.productEntity);
}
final class GetReviewsFaluir extends GetReviewsState {
  final String errMassage;

  GetReviewsFaluir(this.errMassage);
}
