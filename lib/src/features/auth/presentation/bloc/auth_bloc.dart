import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipunggur_app/src/features/auth/data/auth_service.dart';
import 'package:sipunggur_app/src/features/auth/domain/user_model.dart' as user;

import '../../domain/profile_model.dart' as profile;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<ProfileEvent>(_getUser);
  }

  final AuthService _authService = AuthService();

  Future<void> _onLogin(
    LoginEvent loginEvent,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      user.UserModel? userModel = await _authService.loginProfile(
        email: loginEvent.email,
        password: loginEvent.password,
      );

      if (userModel != null) {
        return emit(
          AuthSuccess(userModel),
        );
      }
    } catch (e) {
      return emit(
        AuthFailed('Silakan cek kembali koneksi internet anda'),
      );
    }
  }

  FutureOr<void> _getUser(
    ProfileEvent profileEvent,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(ProfileLoading());

      profile.ProfileModel profileModel = await _authService.getProfile();

      return emit(ProfileSuccess(profileModel));
    } catch (e) {
      return emit(
        ProfileFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }
}
