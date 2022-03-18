import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/Login/login_bloc.dart';
import 'package:mashtoz_flutter/domens/blocs/register_bloc/register_bloc.dart';
import 'package:mashtoz_flutter/domens/repository/authentication_ropsitory.dart';
import 'package:mashtoz_flutter/ui/widgets/login_screen/login_screen.dart';
import 'package:mashtoz_flutter/ui/widgets/singup_screen/singup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = AuthenticationRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (_) => LoginCubit(auth)),
        BlocProvider<RegisterCubit>(create: (_) => RegisterCubit(auth)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: LoginScreen(),
      ),
    );
  }
}
