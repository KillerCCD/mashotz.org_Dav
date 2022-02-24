import 'package:bloc/bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/Login/login_event.dart';
import 'package:mashtoz_flutter/domens/blocs/Login/login_state.dart';
import 'package:mashtoz_flutter/domens/entity/user.dart';
import 'package:mashtoz_flutter/domens/repository/login_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(LoginInitial()) {
    on<UserNameChanged>(onChanged);
    on<ButtonPressed>(onPressed);
  }

  void onChanged(UserNameChanged event, Emitter<LoginState> emit) {
    List<User> changeUser = (state as LoginSucces)
        .users
        .map((user) => user.id == event.user.id ? event.user : user)
        .toList();
    emit(LoginSucces(users: changeUser));
  }

  void onPressed(ButtonPressed event, Emitter<LoginState> emit) {
    if (state is LoginSucces) {
      loginService.login(event.user.toMap());
    }
  }
}
