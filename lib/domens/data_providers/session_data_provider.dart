import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sessionId = 'session_id';
  static const accountId = 'account_id';
  static const regToken = 'token';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();
  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);
  Future<String?> gettRegtoken() => _secureStorage.read(key: _Keys.regToken);
  Future<void> setSessionId(String value) async {
    return _secureStorage.write(
      key: _Keys.sessionId,
      value: value,
    );
  }

  Future<void> deleteSessionId() async {
    return _secureStorage.delete(key: _Keys.sessionId);
  }

  Future<int?> getAccountId() async {
    final id = await _secureStorage.read(key: _Keys.accountId);
    return id != null ? int.tryParse(id) : null;
  }

  Future<void> setAcccountId(int value) async {
    return _secureStorage.write(
      key: _Keys.accountId,
      value: value.toString(),
    );
  }

  Future<void> setRegtoken(String value) async {
    return _secureStorage.write(
      key: _Keys.regToken,
      value: value,
    );
  }

  Future<void> deleteRegToken() async {
    return _secureStorage.delete(key: _Keys.regToken);
  }

  Future<void> deleteAccountId() async {
    return _secureStorage.delete(key: _Keys.accountId);
  }
}
