import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? loginRepository;
  LoginBloc({this.loginRepository}) : super(LoginState.initial()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));

      try {
        final user = await loginRepository?.login(state.email, state.password);
        if (user!.success!) {
          emit(state.copyWith(isSuccess: true));
        } else {
          emit(state.copyWith(isFailure: true));
        }
      } catch (_) {
        emit(state.copyWith(isFailure: true, isSubmitting: false));
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });
  }
}
