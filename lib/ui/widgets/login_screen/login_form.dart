// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/singup_screen/singup_screen.dart';

import '../buttons/facebook_gmail_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 86.0),
                const _LoginIput(),
                const SizedBox(height: 40.0),
                const PasswordInput(),
                const SizedBox(height: 52.0),
                Row(children: const [
                  _ForgotButton(),
                  SizedBox(width: 83.0),
                  _LoginButton(),
                ]),
                const SizedBox(height: 140.0),
              ],
            ),
          ),
          _ComplexButton(),
        ],
      ),
    );
  }
}

class _LoginIput extends StatelessWidget {
  const _LoginIput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Palette.labelText,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.textOrLine)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.textOrLine)),
        labelText: 'էլ. փոստ',
        labelStyle: TextStyle(
          fontFamily: 'Grapalat',
          fontSize: 14,
          color: Palette.labelText,
        ),
        focusColor: Palette.labelText,
      ),
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
    return TextFormField(
      cursorColor: Palette.labelText,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1))),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1))),
        labelText: 'Գաղտնաբառ',
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
                    color: Palette.textOrLine,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Palette.textOrLine,
                  ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 47,
      child: RawMaterialButton(
        onPressed: () {
          print('dadas');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(
              width: 47,
              height: 50,
              child: Image(
                image: AssetImage("assets/images/login_button.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForgotButton extends StatelessWidget {
  const _ForgotButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('object');
      },
      child: const Text(
        'Մոռացե՞լ եք գաղտնաբառը',
        style: TextStyle(
            fontSize: 12, fontFamily: 'Grapalat', color: Palette.main),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
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
        print('grancvel hima');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SignupScreen()));
      },
      child: const Text(
        'Գրանցվել հիմա',
        style: TextStyle(
            fontSize: 16,
            fontFamily: 'Grapalat',
            color: Color.fromRGBO(255, 255, 255, 1)),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
  }
}
