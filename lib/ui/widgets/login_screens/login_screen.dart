import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screens/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(
          83,
          66,
          76,
          1,
        ),
        body: Column(
          children: [
            const SizedBox(height: 50),
            Stack(
              children: [
                SvgPicture.asset("assets/images/mashotz_login_logo.svg"),
              ],
            ),
            const LoginForm(),
          ],
        ));
  }
}
