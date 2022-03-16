// class SignUpWithEmailAndPasswordFailure implements Exception {
//   const SignUpWithEmailAndPasswordFailure([
//     this.message = 'An unknown exception occurred.',
//   ]);

//   factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
//     switch (code) {
//       case 'invalid-email':
//         return const SignUpWithEmailAndPasswordFailure(
//           'Email is not valid or badly formatted.',
//         );
//       case 'user-disabled':
//         return const SignUpWithEmailAndPasswordFailure(
//           'This user has been disabled. Please contact support for help.',
//         );
//       case 'email-already-in-use':
//         return const SignUpWithEmailAndPasswordFailure(
//           'An account already exists for that email.',
//         );
//       case 'operation-not-allowed':
//         return const SignUpWithEmailAndPasswordFailure(
//           'Operation is not allowed.  Please contact support.',
//         );
//       case 'weak-password':
//         return const SignUpWithEmailAndPasswordFailure(
//           'Please enter a stronger password.',
//         );
//       default:
//         return const SignUpWithEmailAndPasswordFailure();
//     }
//   }

//   /// The associated error message.
//   final String message;
// }

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

import 'dart:convert';

import '../../globals.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<void> signUp({required String email, required String password}) async {
    try {
      await createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzBjYzMxNzNhZjI0MTY4NmNiODhiMTg0NDZjNTUxMjE0YWUyOGMwODc3ZmEzMTRkZmJiYjdiMTgxOWE3Mjc2N2EzZjU4NWZjNWVkZmMzOWYiLCJpYXQiOjE2NDI3ODAyNTMsIm5iZiI6MTY0Mjc4MDI1MywiZXhwIjoxNjc0MzE2MjUzLCJzdWIiOiIxNiIsInNjb3BlcyI6W119.VRkfqtqW9Fc41LBb81LYovzVyCe2qktuy1LqanRQffUcyfIil_EUYzJu1Ij63FQ4gjRo1PIN9uHfQHrK8gtX0a4zCGuAYPXWAOY7hyZDwnUtTLvYJXVDPL2bdsef48T9lQF7XTyZSk20_m0JhdC_C8zYwn5w2EIqjnt6f-9qvrkbpAuHbUkNpwUVWoIxAhoDT5QnN1cD_30tpEgnTTS36_k_uTrHrm0QjgTBFe4wjlv4gEacDrtmA4qnVb3dB-VppAuowhldurlYKCTCVmCWOpcrQ-Ufl2pTpFZE4Z6bcP8uda9b5CTvsfrzhy5u9YhZGoNMbSh18aNSg1gUlsjWjTMVTsquVGKCWUvHCya4Rcz__TgaTCnZ8GLtUtv0TV4KqVl-PI-L7jZmTYc40Ut7Z2JoPNQ1XmM62XzDgo2pmjgo6Cie2E24MckqY';
    Map userData = {'email': email, 'password': password};
    try {
      var response = await http.post(Uri.parse(Api.loginUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(userData));
      if (response.statusCode == 200) {
        print('success');
      } else {
        print("failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {String? email, String? password}) async {}
}

class LogOutFailure implements Exception {}
