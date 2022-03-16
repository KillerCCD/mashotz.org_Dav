import 'package:equatable/equatable.dart';

import '../../models/user.dart';

enum AppStatus {
  authenicated,
  unauthenicated,
}

class AppState extends Equatable {
  final AppStatus appStatus;
  final User user;
  const AppState._({
    required this.appStatus,
    this.user = User.empty,
  });

  const AppState.authenicated(User user)
      : this._(appStatus: AppStatus.authenicated, user: user);
  const AppState.unauthenicated() : this._(appStatus: AppStatus.unauthenicated);
  @override
  List<Object?> get props => [appStatus, user];
}
