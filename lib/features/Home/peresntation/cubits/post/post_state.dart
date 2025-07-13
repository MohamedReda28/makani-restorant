part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
final class PostLoading extends PostState {}
final class PostSuccess extends PostState {
  final List<PostEntity> posts;
  PostSuccess({required this.posts});
}
final class PostFaluir extends PostState {
  final String errMassage;
  PostFaluir(this.errMassage);

}
