import 'package:flutter/material.dart';

import '../../../../../config/palette.dart';
import '../../../helper_widgets/actions_widgets.dart';

class AxotqScreen extends StatelessWidget {
  const AxotqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(25, 4, 18, 1),
      padding: const EdgeInsets.only(top: 38),
      child: Scaffold(
          backgroundColor: Palette.textLineOrBackGroundColor,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(43),
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                padding: const EdgeInsets.only(bottom: 22),
                iconSize: 25,
                color: Palette.appBarTitleColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: const ActionsHelper(
                leftPadding: 50,
                botomPadding: 0,
                topPadding: 9,
                text: 'Աղոթք',
                fontFamily: 'Grapalat',
                fontSize: 20,
                laterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Palette.appBarTitleColor,
              ),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Page Account",
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))),
    );
  }
}
