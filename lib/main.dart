import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_screen.dart';
import 'package:mashtoz_flutter/ui/widgets/singup_screen/singup_screen.dart';

import 'ui/widgets/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
