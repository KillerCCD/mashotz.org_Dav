import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/domens/blocs/register_bloc/register_bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/register_bloc/register_state.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_screen.dart';
import '../buttons/facebook_gmail_buttons.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          // Navigator.of(context).pop();
          print('cik');
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(height: screenSize.height / 13),
                  const _FullNameInput(),
                  SizedBox(height: screenSize.height / 17),
                  const _EmailIput(),
                  SizedBox(height: screenSize.height / 17),
                  const PasswordInput(),
                  SizedBox(height: screenSize.height / 17),
                  const Align(
                      alignment: Alignment.centerRight, child: _SignupButton()),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.23,
            ),
            _ComplexButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailIput extends StatelessWidget {
  const _EmailIput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
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
            errorText: state.email.invalid ? 'invalid full NAme' : null,
          ),
          onChanged: (email) =>
              context.read<RegisterCubit>().emailChanged(email),
        );
      },
    );
  }
}

class _FullNameInput extends StatelessWidget {
  const _FullNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        return TextFormField(
          cursorColor: Palette.cursor,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Palette.textLineOrBackGroundColor)),
            enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Palette.textLineOrBackGroundColor)),
            labelText: '?????????? ????????????????',
            labelStyle: const TextStyle(
              fontFamily: 'Grapalat',
              fontSize: 14,
              color: Palette.labelText,
            ),
            focusColor: Palette.labelText,
            errorText: state.fullName.invalid ? 'invalid full NAme' : null,
          ),
          onChanged: (fullName) =>
              context.read<RegisterCubit>().fullaNameChanged(fullName),
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
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
              context.read<RegisterCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _SignupButton extends StatefulWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  State<_SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<_SignupButton> {
  bool _isActive = false;
  void isActive() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
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
                          color:
                              _isActive ? Palette.main : Palette.disableButton,
                          child: RawMaterialButton(
                            splashColor: Palette.whenTapedButton,
                            onPressed: () {
                              isActive();
                              if (state.status.isValidated) {
                                print(state.status.isValidated);
                                context
                                    .read<RegisterCubit>()
                                    .signUpCredentials();
                              }
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 26,
                            child:
                                SvgPicture.asset('assets/images/Vector 81.svg'),
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

class _ComplexButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60.0,
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
        print('mutq gorcel');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: const Text(
        '?????????? ????????????',
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'Grapalat',
            color: Palette.textLineOrBackGroundColor),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
  }
}
