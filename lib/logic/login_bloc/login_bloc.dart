import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!Validators.isValidEmail(event.email)) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Invalid email format'));
      return;
    }
    if (!Validators.isValidPassword(event.password)) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Password must be 8+ chars with upper, lower, digit, symbol'));
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final success = await authRepository.login(event.email, event.password);
      if (success) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Login failed'));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}
