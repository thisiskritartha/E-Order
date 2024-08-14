import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository? registerRepository;
  RegisterBloc({this.registerRepository}) : super(RegisterState.initial()) {
    on<RegisterEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<RegisterPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RegisterConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<RegisterNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<RegisterPhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<RegisterCountryChanged>((event, emit) {
      emit(state.copyWith(country: event.country));
    });

    on<RegisterCityChanged>((event, emit) {
      emit(state.copyWith(city: event.city));
    });

    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));

      try {
        final user = await registerRepository?.register(
          email: state.email,
          password: state.password,
          phone: state.phone,
          fullName: state.fullName,
          country: state.country,
          city: state.city,
        );
        if (user != null) {
          emit(state.copyWith(isSuccess: true));
        }
      } catch (_) {
        emit(state.copyWith(isFailure: true, isSubmitting: false));
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<ToggleConfirmPasswordVisibility>((event, emit) {
      emit(state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
    });
  }
}
