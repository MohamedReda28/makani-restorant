part of 'search_product_cubit.dart';

sealed class SearchProductState {}

final class SearchProductInitial extends SearchProductState {}
final class SearchProductLoading extends SearchProductState {}
final class SearchProductSuccess extends SearchProductState {

  final List<ProductEntity> products;

  SearchProductSuccess({required this.products});
}
final class SearchProductFaluir extends SearchProductState {
  final String errorMessage;

  SearchProductFaluir({required this.errorMessage});
}

