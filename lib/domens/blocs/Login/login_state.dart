import 'package:equatable/equatable.dart';
import 'package:mashtoz_flutter/domens/entity/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSucces extends LoginState {
  final List<User> users;
  const LoginSucces({
    required this.users,
  });
  @override
  String toString() {
    return 'From_LoginState :$users';
  }
}

class LoginFeilure extends LoginState {}
