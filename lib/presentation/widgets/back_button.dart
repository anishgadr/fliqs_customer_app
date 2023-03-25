import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom(
      {Key? key,
      required this.onPressed,
      required this.routeName,
      this.isTextEnabled})
      : super(key: key);

  final GestureTapCallback onPressed;
  final String routeName;
  final bool? isTextEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.backButton),
            child: Image.asset(
              'assets/images/back.png',
              scale: 2,
            ),
          ),
        ),
        Text(isTextEnabled == true ? routeName : "",
            style: const TextStyle(
                color: AppColors.textNavyBlue,
                fontWeight: FontWeight.w500,
                fontFamily: "HeroNew",
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            textAlign: TextAlign.center)
      ],
    );
  }
}
