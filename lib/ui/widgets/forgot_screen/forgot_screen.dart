import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/forgot_screen/forgot_form.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

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
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Palette.textOrLine,
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text(
                      'Մոռացել եք\n գաղտնաբառը',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: 'Grapalat',
                          color: Palette.textOrLine),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Մուտքագրեք ձեր հաշվում լրացված\n էլեկտրոնային փոստի հասցեն',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Grapalat',
                    color: Palette.textOrLine),
              ),
              const ForgotForm(),
            ],
          ),
        ),
      ),
    );
  }
}
