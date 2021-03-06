import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/domens/blocs/Login/login_bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/Login/login_state.dart';
import 'package:mashtoz_flutter/ui/widgets/forgot_screen/forgot_screen.dart';
import 'package:mashtoz_flutter/ui/widgets/singup_screen/singup_screen.dart';
import '../buttons/facebook_gmail_buttons.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print("width : ${screenSize.width}");
    print("width : ${screenSize.height}");
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          print('dadas');
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: screenSize.height / 15),
                    const _LoginIput(),
                    SizedBox(height: screenSize.height / 15),
                    const PasswordInput(),
                    SizedBox(height: screenSize.height / 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _ForgotButton(),
                          _LoginButton(),
                        ]),
                  ],
                ),
              ),

              // Text(
              //     'width : ${screenSize.width} , height: ${screenSize.height / 10.6}'),
              SizedBox(height: screenSize.height * 0.3),
              _ComplexButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginIput extends StatelessWidget {
  const _LoginIput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        print("Login input ${state.email.invalid}");
        return TextFormField(
          cursorColor: Palette.cursor,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Palette.textLineOrBackGroundColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Palette.textLineOrBackGroundColor)),
            labelText: '????. ????????',
            labelStyle: const TextStyle(
              fontFamily: 'Grapalat',
              fontSize: 14,
              color: Palette.labelText,
            ),
            focusColor: Palette.labelText,
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
        );
      },
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isHiddenPassword = true;

  void _togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          print("password input ${state.email.invalid}");
          return TextFormField(
            cursorColor: Palette.cursor,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(255, 255, 255, 1))),
              enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(255, 255, 255, 1))),
              labelText: '??????????????????',
              labelStyle: const TextStyle(
                  fontFamily: 'Grapalat',
                  fontSize: 14,
                  color: Color.fromRGBO(189, 189, 189, 1)),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: InkWell(
                  onTap: _togglePassword,
                  child: isHiddenPassword
                      ? const Icon(
                          Icons.visibility,
                          color: Palette.textLineOrBackGroundColor,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Palette.textLineOrBackGroundColor,
                        ),
                ),
              ),
              errorText: state.password.invalid ? 'invalid password' : null,
            ),
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
          );
        });
  }
}

class _LoginButton extends StatefulWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  State<_LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<_LoginButton> {
  bool _isActive = false;
  void isActive() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const CircularProgressIndicator()
              : SizedBox(
                  width: 47,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          //fit: StackFit.expand,
                          alignment: Alignment.centerRight,
                          //overflow: Overflow.visible,
                          children: [
                            /// bottom
                            Container(
                              width: 40,
                              height: 40,
                              // color: Colors.orange,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                  spreadRadius: -1,
                                  blurRadius: 1,
                                  offset: Offset(7, 5),
                                ),
                              ]),
                            ),
                            Container(
                              width: 37,
                              height: 40,
                              color: _isActive
                                  ? Palette.main
                                  : Palette.disableButton,
                              child: RawMaterialButton(
                                splashColor: Palette.whenTapedButton,
                                onPressed: () async {
                                  isActive();
                                  print("dadas");
                                  if (state.status.isValidated) {
                                    print(state.status.isValidated);
                                    context
                                        .read<LoginCubit>()
                                        .loginWithCredentials();
                                  }
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 26,
                                child: SvgPicture.asset(
                                    'assets/images/Vector 81.svg'),
                              ),
                            ),

                            /// top
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}

class _ForgotButton extends StatelessWidget {
  const _ForgotButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('moraceleq gaxtnabary');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ForgotScreen()));
      },
      child: const Text(
        '???????????????? ???? ????????????????????',
        style: TextStyle(
            fontSize: 12, fontFamily: 'Grapalat', color: Palette.main),
      ),
      style: TextButton.styleFrom(
        primary: Colors.amber,
        padding: const EdgeInsets.only(right: 40),
      ),
    );
  }
}

class _ComplexButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenSize.height / 15,
            color: Palette.barColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _SignUpButton(),
                  CoupleButtons(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('grancvel hima');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SignupScreen()));
      },
      child: const Text(
        '???????????????? ????????',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Grapalat',
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
  }
}
