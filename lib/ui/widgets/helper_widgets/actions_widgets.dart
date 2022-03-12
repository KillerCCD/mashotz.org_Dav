// ignore_for_file: no_logic_in_create_state

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mashtoz_flutter/ui/widgets/helper_widgets/text_widgets.dart';

import '../../../config/palette.dart';

class ActionsHelper extends StatefulWidget {
  final double? sizeIcon;
  final double? sizeBox;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final double? laterSpacing;
  final FontWeight? fontWeight;
  final double? topPadding;
  final double? leftPadding;
  final double? botomPadding;
  final String? text;

  const ActionsHelper({
    Key? key,
    this.botomPadding,
    this.sizeIcon,
    this.sizeBox,
    this.color,
    this.text = '',
    this.topPadding = 0,
    this.leftPadding = 0,
    this.fontSize = 0,
    this.fontFamily = '',
    this.laterSpacing = 0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  State<ActionsHelper> createState() => _ActionsHelperState(
        fontFamily: fontFamily,
        fontSize: fontSize,
        text: text,
        fontWeight: fontWeight,
        topPadding: topPadding,
        laterSpacing: laterSpacing,
        leftPadding: leftPadding,
        botomPadding: botomPadding,
        color: color,
      );
}

class _ActionsHelperState extends State<ActionsHelper>
    with SingleTickerProviderStateMixin {
  final double? sizeIcon;
  final double? sizeBox;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final double? laterSpacing;
  final FontWeight? fontWeight;
  final double? topPadding;
  final double? leftPadding;
  final String? text;
  final double? botomPadding;
  _ActionsHelperState({
    this.sizeIcon,
    this.sizeBox,
    this.color,
    this.text,
    this.topPadding = 0,
    this.leftPadding = 0,
    this.botomPadding = 0,
    this.fontSize = 0,
    this.fontFamily = '',
    this.laterSpacing = 0,
    this.fontWeight = FontWeight.normal,
  });
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: topPadding!, left: leftPadding!),
          child: Text(
            text ?? '',
            style: TextStyle(
                letterSpacing: laterSpacing,
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color),
          ),
        ),
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
                      : const Color.fromRGBO(122, 108, 115, 1),
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
