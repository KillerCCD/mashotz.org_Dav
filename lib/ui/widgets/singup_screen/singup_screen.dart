import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_form.dart';

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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                  ],
                ),
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
