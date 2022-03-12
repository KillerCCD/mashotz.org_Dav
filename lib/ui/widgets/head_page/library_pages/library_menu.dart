import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mashtoz_flutter/config/palette.dart';
import 'package:mashtoz_flutter/ui/widgets/head_page/library_pages/axotq_page/axotq_screen.dart';
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
  final libraryPages = const [
    TextHelper(
        text: 'Աղոթք',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Ջատագովություն',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Աստվածաշնչյան Նյութեր',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
      text: 'Քրիստոնեական Ուսուցում',
      fontSize: 18,
      fontFamily: 'Grapalat',
      fontWeight: FontWeight.w400,
      laterSpacing: 1,
      color: Palette.textLineOrBackGroundColor,
    ),
    TextHelper(
        text: 'Մարեմական Նյութեր',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Հայրախոսական Մատենաշար',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Վարք Սրբոց',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Հոգեշահ Հեղինակներ',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Հոգեշահ Հեղինակներ',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Ընդհանրական Եկեղեցու Վավերագրեր',
        fontSize: 18,
        textAlign: TextAlign.right,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Հոգեբանություն',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
    TextHelper(
        text: 'Աղանդներ',
        fontSize: 18,
        fontFamily: 'Grapalat',
        fontWeight: FontWeight.w400,
        laterSpacing: 1,
        color: Palette.textLineOrBackGroundColor),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(25, 4, 18, 1),
      padding: const EdgeInsets.only(top: 38),
      child: Scaffold(
          backgroundColor: Palette.libraryBacgroundColor,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(43),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Palette.barColor,
              flexibleSpace: const Padding(
                padding: EdgeInsets.only(),
                child: ActionsHelper(
                  leftPadding: 20,
                  botomPadding: 1.5,
                  text: 'Գարադարան',
                  fontFamily: 'Grapalat',
                  fontSize: 23,
                  laterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Palette.textLineOrBackGroundColor,
                ),
              ),
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
                        itemCount: libraryPages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: ListTile(
                              trailing: libraryPages[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const AxotqScreen(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
          )),
    );
  }
}

// class MyItem extends StatelessWidget {
//   final int? index;
//   final List<Widget>? listsData;

//   const MyItem({Key? key, this.index, this.listsData}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = Colors.primaries[index! % Colors.primaries.length];
//     final hexRgb = color.shade500.toString().substring(10, 16).toUpperCase();
//     return const ListTile(
//       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       trailing: Text('$listsData[]'),
//     );
//   }
// }
