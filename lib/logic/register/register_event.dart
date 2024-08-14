part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {}

final class RegisterEmailChanged extends RegisterEvent {
  final String email;
  RegisterEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  RegisterPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  RegisterConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

final class RegisterNameChanged extends RegisterEvent {
  final String fullName;
  RegisterNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

final class RegisterPhoneChanged extends RegisterEvent {
  final String phone;
  RegisterPhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

final class RegisterCountryChanged extends RegisterEvent {
  final String country;
  RegisterCountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}

final class RegisterCityChanged extends RegisterEvent {
  final String city;
  RegisterCityChanged(this.city);

  @override
  List<Object?> get props => [city];
}

final class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

final class TogglePasswordVisibility extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleConfirmPasswordVisibility extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
