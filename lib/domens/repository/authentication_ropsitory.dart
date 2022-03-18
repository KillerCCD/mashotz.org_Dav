import 'dart:convert';
import 'dart:developer';

import 'package:mashtoz_flutter/domens/data_providers/session_data_provider.dart';
import 'package:mashtoz_flutter/domens/models/categoy_list.dart';

import '../../globals.dart';
import 'package:http/http.dart' as http;

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String? message;
  const SignUpWithEmailAndPasswordFailure([
    this.message,
  ]);

  static SignUpWithEmailAndPasswordFailure singUpExeptions(String e) {
    switch (e) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'password min 8 digits':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.

}

// class LogInWithEmailAndPasswordFailure implements Exception {
//   /// {@macro log_in_with_email_and_password_failure}
//   const LogInWithEmailAndPasswordFailure([
//     this.message = 'An unknown exception occurred.',
//   ]);

//   /// Create an authentication message
//   /// from a firebase authentication exception code.
//   factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
//     switch (code) {
//       case 'invalid-email':
//         return const LogInWithEmailAndPasswordFailure(
//           'Email is not valid or badly formatted.',
//         );
//       case 'user-disabled':
//         return const LogInWithEmailAndPasswordFailure(
//           'This user has been disabled. Please contact support for help.',
//         );
//       case 'user-not-found':
//         return const LogInWithEmailAndPasswordFailure(
//           'Email is not found, please create an account.',
//         );
//       case 'wrong-password':
//         return const LogInWithEmailAndPasswordFailure(
//           'Incorrect password, please try again.',
//         );
//       default:
//         return const LogInWithEmailAndPasswordFailure();
//     }
//   }

//   /// The associated error message.
//   final String message;
// }
//on LogInWithEmailAndPasswordFailure catch (e) {
//throw LogInWithEmailAndPasswordFailure.fromCode(e.message);

class AuthenticationRepository {
  final sessionDataProvider = SessionDataProvider();
  Future<bool> signUp(
      {required String email,
      required String password,
      required fullName}) async {
    bool isSuscces = false;
    try {
      isSuscces = await createUserWithNAmeEmailAndPassword(
          email: email, password: password, fullName: fullName) as bool;
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      print(e);
      throw SignUpWithEmailAndPasswordFailure.singUpExeptions(e.message!);
    } catch (_) {}
    return isSuscces;
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  Future<void> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    Map userData = {
      'email': email,
      'password': password,
    };
    try {
      var response = await http.post(
        Uri.parse(Api.loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );
      var body = jsonDecode(response.body);
      var data = body['data']['content'];
      print(data);
      if (response.statusCode == 200) {
        print('success');
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool?> createUserWithNAmeEmailAndPassword(
      {String? email, String? password, String? fullName}) async {
    Map userData = {
      'email': 'asa.asa@gmail.com',
      'password': 'asdfghjk',
      // 'full_name': fullName,
    };
    // var token = await sessionDataProvider.gettRegtoken();
    var token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbWFzaHRvei5vcmdcL2FwaVwvdjFcL2xvZ2luIiwiaWF0IjoxNjQ3NjI2NDYyLCJleHAiOjE2NDc2MzAwNjIsIm5iZiI6MTY0NzYyNjQ2MiwianRpIjoiSWVQRUZ6cVFnRUxUaFhwZCIsInN1YiI6MjUsInBydiI6ImEzZDg2OGQ4OTEyOTZhZTMwNzM2NjJiMmYwMjRkY2Y2YzY3YjUzZmMiLCJyb2xlIjoiY3VzdG9tZXIifQ.4K5NQ7rIXFvwLVGaySPopyniR_oiycBwzxeSMP_6eg8";
    print('$token object');
    bool isSucces = false;
    try {
      var response = await http.get(
        Uri.parse('https://mashtoz.org/api/v1/me'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        //body: jsonEncode(userData),
      );
      var body = jsonDecode(response.body);
      var success = body['success'];
      if (success == true) {
        var data = body['data'];
        final library = libraryFromJson(data);
        inspect(library);
        // sessionDataProvider.setRegtoken(token);
        print(token);
        isSucces = true;
      } else {
        print("failed");
        isSucces = false;
        throw SignUpWithEmailAndPasswordFailure.singUpExeptions('bolola');
      }
    } catch (e) {
      print(e);
    }
    return isSucces;
  }
}

class LogOutFailure implements Exception {}
