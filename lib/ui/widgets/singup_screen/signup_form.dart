// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashtoz_flutter/config/palette.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: const [
                SizedBox(height: 86.0),
                _FullNameInput(),
                SizedBox(height: 40.0),
                _EmailIput(),
                SizedBox(height: 40.0),
                PasswordInput(),
                SizedBox(height: 52.0),
                // Row(children: const [

                // ]),
                Align(alignment: Alignment.centerRight, child: _LoginButton()),
                SizedBox(height: 93.0),
              ],
            ),
          ),
          _ComplexButton(),
        ],
      ),
    );
  }
}

class _EmailIput extends StatelessWidget {
  const _EmailIput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Palette.main,
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

class _FullNameInput extends StatelessWidget {
  const _FullNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Palette.main,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.textOrLine)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Palette.textOrLine)),
        labelText: 'Անուն Ազգանուն',
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
      cursorColor: Palette.main,
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
    bool inActive = false;
    return SizedBox(
      width: 47,
      child: RawMaterialButton(
        onPressed: () {
          print('dadas');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/images/mains_button.svg",
            
              // color: Color.fromRGBO(189, 189, 189, 1),
            ),
          ],
        ),
      ),
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
        print('mutq gorcel');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      child: const Text(
        'Մուտք գործել',
        style: TextStyle(
            fontSize: 16, fontFamily: 'Grapalat', color: Palette.textOrLine),
      ),
      style: TextButton.styleFrom(padding: const EdgeInsets.only(right: 40)),
    );
  }
}
