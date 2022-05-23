import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> tyres(BoxConstraints constrains) {
  return [
    Positioned(
      left: (constrains.maxWidth / 2) - (constrains.maxHeight * 0.16),
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset(
        'assets/icons/FL_Tyre.svg',
        height: constrains.maxHeight * 0.1,
      ),
    ),
    Positioned(
      right: (constrains.maxWidth / 2) - (constrains.maxHeight * 0.16),
      top: constrains.maxHeight * 0.22,
      child: SvgPicture.asset(
        'assets/icons/FL_Tyre.svg',
        height: constrains.maxHeight * 0.1,
      ),
    ),
    Positioned(
      left: (constrains.maxWidth / 2) - (constrains.maxHeight * 0.16),
      top: constrains.maxHeight * 0.65,
      child: SvgPicture.asset(
        'assets/icons/FL_Tyre.svg',
        height: constrains.maxHeight * 0.1,
      ),
    ),
    Positioned(
      right: (constrains.maxWidth / 2) - (constrains.maxHeight * 0.16),
      top: constrains.maxHeight * 0.65,
      child: SvgPicture.asset(
        'assets/icons/FL_Tyre.svg',
        height: constrains.maxHeight * 0.1,
      ),
    ),
  ];
}
