import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:mashtoz_flutter/domens/blocs/register_bloc/register_state.dart';
import 'package:mashtoz_flutter/domens/models/email.dart';
import 'package:mashtoz_flutter/domens/models/full_name.dart';
import 'package:mashtoz_flutter/domens/models/passowrd.dart';
import '../../repository/authentication_ropsitory.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository _authenticationRepository;
  RegisterCubit(this._authenticationRepository) : super(const RegisterState());
  void fullaNameChanged(String value) {
    final fullName = FullName.dirty(value);
    print(fullName);
    emit(state.copyWith(
      fullName: fullName,
      status: Formz.validate([
        fullName,
        state.email,
        state.password,
      ]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    print(email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        state.fullName,
        email,
        state.password,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    print(password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.fullName,
        state.email,
        password,
      ]),
    ));
  }

  Future<void> signUpCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      bool isSuccess = await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
        fullName: state.fullName.value,
      );
      print("is success $isSuccess");
      if (isSuccess) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzStatus.submissionFailure,
        ),
      );
    } catch (e){
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
