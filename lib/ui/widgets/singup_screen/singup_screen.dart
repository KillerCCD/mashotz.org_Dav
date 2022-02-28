import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_form.dart';
import 'package:mashtoz_flutter/ui/widgets/singup_screen/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(
        83,
        66,
        76,
        1,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Palette.textOrLine,
                    ),
                    SizedBox(
                      width: 79,
                    ),
                    Text(
                      'Գրանցում',
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Grapalat',
                          color: Palette.textOrLine),
                    ),
                  ],
                ),
              ),
              const SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
