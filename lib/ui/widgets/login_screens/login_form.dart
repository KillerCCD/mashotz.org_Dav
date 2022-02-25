import 'dart:ui';

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 125.0),
          TextFormField(),
          const SizedBox(height: 70.0),
          TextFormField(),
          const SizedBox(height: 52.0),
          Row(children: [
            forgotPassword(),
            const SizedBox(width: 42.0),
            logimButton(),
          ])
        ],
      ),
    );
  }
  // Widget _emailField() {
  //   return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 30.0,
  //         vertical: 5.0,
  //       ),
  //       child: TextFormField(
  //         controller: _emailController,
  //         validator: (value) {
  //           if (value == null ||
  //               value.isEmpty ||
  //               !Validators.isValidEmail(value)) {
  //             return 'invalid email';
  //           }
  //           return null;
  //         },
  //         onChanged: (email) =>
  //             context.read<LoginBloc>().add(LoginEmailChanged(email: email)),
  //         decoration: InputDecoration(
  //           //border: OutlineInputBorder(),
  //           labelStyle: const TextStyle(color: Colors.grey),
  //           labelText: 'email text',
  //           // errorText: !state.isEmailValid ? 'Invalid Email' : null,
  //           hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13),
  //           focusedBorder: UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.green[700]),
  //           ),
  //         ),
  //         keyboardType: TextInputType.emailAddress,
  //         autocorrect: false,
  //       ),
  //     );
  //   });
  // }

  // Widget _passwordField() {
  //   return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 30.0,
  //         vertical: 0.0,
  //       ),
  //       child: TextFormField(
  //         controller: _passwordController,
  //         validator: (value) {
  //           if (value == null ||
  //               value.isEmpty ||
  //               !Validators.isValidPassword(value)) {
  //             return 'minimum 6 characters';
  //           }
  //           return null;
  //         },
  //         onChanged: (password) => context
  //             .read<LoginBloc>()
  //             .add(LoginPasswordChanged(password: password)),
  //         decoration: InputDecoration(
  //           //border: OutlineInputBorder(),
  //           labelStyle: const TextStyle(color: Colors.grey),
  //           focusedBorder: UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.green[700]),
  //           ),
  //           labelText: 'password',
  //           // errorText: !state.isPasswordValid
  //           //     ? AppLocalizations.of(context).passwordErrorText
  //           //     : null,
  //         ),
  //         obscureText: true,
  //         autocorrect: false,
  //       ),
  //     );
  //   });
  // }
  Widget forgotPassword() {
    return TextButton(
      onPressed: () {
        print('object');
      },
      child: const Text(
        'Մոռացե՞լ եք գաղտնաբառը',
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'Grapalat',
            color: Color.fromRGBO(250, 147, 114, 1)),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
  }

  Widget logimButton() {
    return TextButton(
      onPressed: () {
        print('object');
      },
      child: const Text(
        'Մոռացե',
        style: TextStyle(
            fontSize: 12,
            fontFamily: 'Grapalat',
            color: Color.fromRGBO(250, 147, 114, 1)),
      ),
      style: TextButton.styleFrom(),
    );
  }
}
