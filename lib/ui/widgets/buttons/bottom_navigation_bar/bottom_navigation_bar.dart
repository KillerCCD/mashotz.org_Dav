// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../home_screen.dart';
import 'bottom_app_bar.dart';

class BottomNavBar extends StatefulWidget {
  final BottomIcons? icons;

  const BottomNavBar({Key? key, this.icons}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState(icons: icons);
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomIcons? icons;

  _BottomNavBarState({this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      // padding: const EdgeInsets.only(top: 14),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
            // color: Colors.black,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icons == BottomIcons.home
                    ? Expanded(
                        child: CustomPaint(
                          size: const Size(42, 22),
                          painter: Triangle(),
                        ),
                      )
                    : Expanded(child: Container()),
                icons == BottomIcons.library
                    ? Expanded(
                        child: CustomPaint(
                          size: const Size(42, 22),
                          painter: Triangle(),
                        ),
                      )
                    : Expanded(child: Container()),
                icons == BottomIcons.search
                    ? Expanded(
                        child: CustomPaint(
                          size: const Size(42, 22),
                          painter: Triangle(),
                        ),
                      )
                    : Expanded(child: Container()),
                icons == BottomIcons.italian
                    ? Expanded(
                        child: CustomPaint(
                          size: const Size(42, 22),
                          painter: Triangle(),
                        ),
                      )
                    : Expanded(child: Container()),
                icons == BottomIcons.account
                    ? Expanded(
                        child: CustomPaint(
                          size: const Size(42, 22),
                          painter: Triangle(),
                        ),
                      )
                    : Expanded(child: Container()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Container(
                      height: 55,
                      color: const Color.fromRGBO(83, 66, 77, 1),
                      child: Row(
                        children: [
                          // const SizedBox(width: 22.0),
                          Expanded(
                            child: BottomBar(
                              onPressed: () {
                                print('home');
                                setState(() {
                                  icons = BottomIcons.home;
                                });
                              },
                              bottomIcons:
                                  icons == BottomIcons.home ? true : false,
                              path: SvgPicture.asset(
                                'assets/images/home.svg',
                                width: 25,
                                height: 30,
                              ),
                            ),
                          ),
                          //  const SizedBox(width: 45.0),
                          Expanded(
                            child: BottomBar(
                              onPressed: () {
                                print('library');
                                setState(() {
                                  icons = BottomIcons.library;
                                });
                              },
                              bottomIcons:
                                  icons == BottomIcons.library ? true : false,
                              path: SvgPicture.asset(
                                'assets/images/library.svg',
                                width: 25,
                                height: 30,
                              ),
                            ),
                          ),
                          //const SizedBox(width: 45.0),
                          Expanded(
                            child: BottomBar(
                                onPressed: () {
                                  print('search');
                                  setState(() {
                                    icons = BottomIcons.search;
                                  });
                                },
                                bottomIcons:
                                    icons == BottomIcons.search ? true : false,
                                path: SvgPicture.asset(
                                  'assets/images/search.svg',
                                  width: 25,
                                  height: 27,
                                )),
                          ),
                          // const SizedBox(width: 45.0),
                          Expanded(
                            child: BottomBar(
                              onPressed: () {
                                print('italian');
                                setState(() {
                                  icons = BottomIcons.italian;
                                });
                              },
                              bottomIcons:
                                  icons == BottomIcons.italian ? true : false,
                              path: SvgPicture.asset(
                                'assets/images/italian_lessons.svg',
                                width: 25,
                                height: 30,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 40.0),
                          Expanded(
                            child: BottomBar(
                              onPressed: () {
                                print('account');
                                setState(() {
                                  icons = BottomIcons.account;
                                });
                              },
                              bottomIcons:
                                  icons == BottomIcons.account ? true : false,
                              path: SvgPicture.asset(
                                'assets/images/profile.svg',
                                width: 25,
                                height: 27,
                              ),
                            ),
                          ),
                          //const SizedBox(width: 40.0),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
