import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'buttons/bottom_navigation_bar/bottom_app_bar.dart';
import 'buttons/bottom_navigation_bar/bottom_navigation_bar.dart';

//enum BottomIcons { Home, Favorite, Search, Account }
enum BottomIcons { home, library, search, italian, account }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keys = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('data'),
              // bottomIcons == BottomIcons.home
              //     ? const Center(
              //         child: Text(
              //           "Hi, this is home page",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       )
              //     : Container(),
              // bottomIcons == BottomIcons.library
              //     ? const Center(
              //         child: Text(
              //           "Hi, this is favorite page",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       )
              //     : Container(),
              // bottomIcons == BottomIcons.search
              //     ? const Center(
              //         child: Text(
              //           "Hi, this is search page",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       )
              //     : Container(),
              // BottomIcons.italian
              //     ? const Center(
              //         child: Text(
              //           "Hi, this is account page",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //       )
              //     : Container(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(
          icons: BottomIcons.home,
        ));
  }
}
