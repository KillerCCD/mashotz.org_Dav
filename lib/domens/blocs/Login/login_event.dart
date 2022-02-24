import 'package:equatable/equatable.dart';

import 'package:mashtoz_flutter/domens/entity/user.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserNameChanged extends LoginEvent {
  final User user;
  const UserNameChanged({
    required this.user,
  });
  @override
  List<Object?> get props => [user];

  @override
  String toString() {
    return 'From_LoginEvent : $user';
  }
}

class UserPasswordChanged extends LoginEvent {
  final String password;
  const UserPasswordChanged({
    required this.password,
  });
  @override
  List<Object?> get props => [password];

  @override
  String toString() {
    return 'From_LoginEvent : $password';
  }
}

class ButtonPressed extends LoginEvent {
  final User user;
  const ButtonPressed({
    required this.user,
  });
  @override
  List<Object?> get props => [user];

  @override
  String toString() {
    return 'From_LoginEvent :$user';
  }
}
