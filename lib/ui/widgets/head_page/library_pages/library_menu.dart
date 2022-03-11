import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/helper_widgets/text_widgets.dart';

import '../../helper_widgets/actions_widgets.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(25, 4, 18, 1),
      padding: const EdgeInsets.only(top: 23),
      child: Scaffold(
          backgroundColor: Palette.libraryBacgroundColor,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(63),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Palette.barColor,
              title: const TextHelper(
                text: 'Գրադարան',
                bottomPadding: 30,
                fontSize: 23,
                fontFamily: 'Grapalat',
                laterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
              flexibleSpace: const ActionsHelper(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Scrollbar(
                      thickness: 3,
                      radius: const Radius.circular(12),
                      isAlwaysShown: true,
                      showTrackOnHover: true,
                      child: ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) => MyItem(index: index),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}

class MyItem extends StatelessWidget {
  final int? index;

  const MyItem({Key? key, this.index}) : super(key: key);
  final libraryPages = const [];
  @override
  Widget build(BuildContext context) {
    final color = Colors.primaries[index! % Colors.primaries.length];
    final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      trailing: Text('dadas'),
    );
  }
}
