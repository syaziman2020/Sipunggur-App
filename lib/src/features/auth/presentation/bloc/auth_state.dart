part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String message;
  AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthSuccess extends AuthState {
  final user.UserModel userModel;
  AuthSuccess(this.userModel);

  @override
  List<Object> get props => [userModel];
}

final class ProfileFailed extends AuthState {
  final String message;
  ProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class ProfileSuccess extends AuthState {
  final profile.ProfileModel profileModel;
  ProfileSuccess(this.profileModel);

  @override
  List<Object> get props => [profile.ProfileModel()];
}

final class ProfileLoading extends AuthState {}

final class LogoutLoading extends AuthState {}

final class LogoutFailed extends AuthState {
  final String message;
  LogoutFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class LogoutSuccess extends AuthState {
  final bool result;
  LogoutSuccess(this.result);

  @override
  List<Object> get props => [result];
}
