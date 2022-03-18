import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import 'package:mashtoz_flutter/domens/blocs/Login/login_state.dart';
import 'package:mashtoz_flutter/domens/models/email.dart';
import 'package:mashtoz_flutter/domens/models/passowrd.dart';

import 'package:mashtoz_flutter/domens/repository/user_data_provider.dart';

import '../../repository/authentication_ropsitory.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    print(email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    print(password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> loginWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
