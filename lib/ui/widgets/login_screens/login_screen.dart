import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //   child: Stack(
            //     children: [
            //       SvgPicture.asset('/images/mashotz_login_logo.svg'),
            //     ],
            //   ),
            // ),
            Center(
              child: Text(
                'Արշալույս',
                style: TextStyle(
                    fontFamily: 'Armenian',
                    fontSize: 30.0,
                    color: Color.fromRGBO(251, 196, 102, 1)),
              ),
            ),
          ],
        ));
  }
}
