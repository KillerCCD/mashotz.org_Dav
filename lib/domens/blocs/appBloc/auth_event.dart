import 'package:equatable/equatable.dart';

import '../../models/user.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppUserChanged extends AppEvent {
  final User user;
  const AppUserChanged(this.user);
  @override
  List<Object?> get props => [user];
}
