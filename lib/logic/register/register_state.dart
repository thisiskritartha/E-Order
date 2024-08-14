part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final String fullName;
  final String phone;
  final String country;
  final String city;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;

  const RegisterState({
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.country,
    required this.phone,
    required this.city,
    required this.fullName,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      email: '',
      password: '',
      confirmPassword: '',
      fullName: '',
      phone: '',
      country: '',
      city: '',
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      isPasswordVisible: false,
      isConfirmPasswordVisible: false,
    );
  }

  RegisterState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? fullName,
    String? phone,
    String? country,
    String? city,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.password,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      city: city ?? this.city,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        fullName,
        phone,
        country,
        city,
        isSubmitting,
        isSuccess,
        isFailure,
        isPasswordVisible,
        isConfirmPasswordVisible,
      ];
}
