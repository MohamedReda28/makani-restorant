part of 'lougout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LougoutInitial extends LogoutState {}
final class LougoutLoading extends LogoutState {}
final class LougoutSuccess extends LogoutState {
  final String massege;

  LougoutSuccess({required this.massege});
}
final class LougoutFaluir extends LogoutState {
  final String merror;

  LougoutFaluir({required this.merror});
}

