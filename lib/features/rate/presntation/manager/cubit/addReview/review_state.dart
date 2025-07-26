part of 'review_cubit.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFaluir extends ReviewState {
  final String erorrMassege;

  ReviewFaluir(this.erorrMassege);
}

final class ReviewSuccesss extends ReviewState {

}
