import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/buttons/facebook_gmail_buttons.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_screen.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
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
                SizedBox(height: 40.0),
                _EmailIput(),
                SizedBox(height: 40.0),
                Align(alignment: Alignment.centerRight, child: _LoginButton()),
              ],
            ),
          ),
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
