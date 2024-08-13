part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isPasswordVisible;

  const LoginState({
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.email,
    required this.password,
    this.isPasswordVisible = false,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isPasswordVisible: false,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? isPasswordVisible,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible);
  }

  @override
  List<Object?> get props => [email, password, isSubmitting, isSuccess, isFailure, isPasswordVisible];
}
