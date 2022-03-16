import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/appBloc/auth_event.dart';
import 'package:mashtoz_flutter/domens/blocs/appBloc/auth_state.dart';

import '../../data_providers/session_data_provider.dart';
import '../../models/user.dart';
import '../../repository/authentication_ropsitory.dart';

class AuthBloc extends Bloc<AppEvent, AppState> {
  // final _sessionDataProvider = SessionDataProvider();
  final AuthenticationRepository _authenticationRepository;

  AuthBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AppState.unauthenicated()) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogaoutRequested);
  }

  FutureOr<void> _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenicated(event.user)
        : const AppState.unauthenicated());
  }

  FutureOr<void> _onLogaoutRequested(
      AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }
}
