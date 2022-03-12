import 'package:flutter/material.dart';
import 'package:mashtoz_flutter/ui/widgets/helper_widgets/text_widgets.dart';

import '../../../../config/palette.dart';
import '../../helper_widgets/actions_widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(25, 4, 18, 1),
      padding: const EdgeInsets.only(top: 38),
      child: Scaffold(
          backgroundColor: Palette.searchBackGroundColor,
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
                text: 'Որոնել',
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
                  "Page Search",
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
