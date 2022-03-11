import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/palette.dart';

class ActionsHelper extends StatefulWidget {
  final double? sizeIcon;
  final double? sizeBox;
  final Color? color;

  const ActionsHelper({
    Key? key,
    this.sizeIcon,
    this.sizeBox,
    this.color,
  }) : super(key: key);

  @override
  State<ActionsHelper> createState() => _ActionsHelperState();
}

class _ActionsHelperState extends State<ActionsHelper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool iconAcitve = true;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  bool _isDrawerOpen() {
    return _controller.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _controller.status == AnimationStatus.forward;
  }

  void _toggleDrawer() {
    if (_controller.isCompleted) {
      _controller.reverse();
      setState(() {
        iconAcitve = true;
      });
    } else {
      _controller.forward();
      setState(() {
        iconAcitve = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0, end: 0.5 * pi).animate(_controller);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
            height: 120,
            width: 42,
            child: Stack(children: [
              InkWell(
                onTap: _toggleDrawer,
                child: SvgPicture.asset(
                  'assets/images/app_bar_icon_button.svg',

                  color: iconAcitve
                      ? Palette.appBarIconMenuColor
                      : Palette.appBarIconCloseColor,
                  fit: BoxFit.cover,
                  height: 120,
                  //width: 60,
                  //width: 22,
                ),
              ),
              SizedBox(
                  height: 70,
                  width: 50,
                  child: Center(
                    child: InkWell(
                      onTap: _toggleDrawer,
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: animation.value.toDouble(),
                            child: InkWell(
                              onTap: _toggleDrawer,
                              child: _isDrawerOpen() || _isDrawerOpening()
                                  ? SvgPicture.asset(
                                      'assets/images/close_bar_icon.svg',
                                      height: 15,
                                      width: 8,
                                    )
                                  : SvgPicture.asset(
                                      'assets/images/asset_bar_icon.svg',
                                      height: 10,
                                      width: 8,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}
