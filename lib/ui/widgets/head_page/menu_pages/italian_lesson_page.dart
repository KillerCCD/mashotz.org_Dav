import 'package:flutter/material.dart';

import '../../../../config/palette.dart';
import '../../helper_widgets/actions_widgets.dart';
import '../../helper_widgets/text_widgets.dart';

class ItalianPage extends StatelessWidget {
  const ItalianPage({Key? key}) : super(key: key);

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
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: const ActionsHelper(
                  leftPadding: 20,
                  botomPadding: 1.5,
                  text: 'Իտալերենի դասեր',
                  fontFamily: 'Grapalat',
                  fontSize: 20,
                  laterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Palette.appBarTitleColor),
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Page Italian 4",
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
