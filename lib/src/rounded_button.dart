import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    this.buttonStyle,
    this.textStyle,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
      color: Colors.white,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
    TextStyle? customTextStyle = textStyle;
    if (customTextStyle != null) {
      customTextStyle = customTextStyle.copyWith(
          color: customTextStyle.color ?? defaultStyle.color,
          fontSize: customTextStyle.fontSize ?? defaultStyle.fontSize,
          fontWeight: customTextStyle.fontWeight ?? defaultStyle.fontWeight);
    } else {
      customTextStyle = defaultStyle;
    }

    ButtonStyle defaultButtonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(const Color(0xFF0BBBF0)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.r)),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
    ButtonStyle? customButtonStyle = buttonStyle;
    if (customButtonStyle != null) {
      customButtonStyle = customButtonStyle.copyWith(
        tapTargetSize:
            customButtonStyle.tapTargetSize ?? defaultButtonStyle.tapTargetSize,
        backgroundColor: customButtonStyle.backgroundColor ??
            defaultButtonStyle.backgroundColor,
        shape: customButtonStyle.shape ?? defaultButtonStyle.shape,
        elevation: customButtonStyle.elevation ?? defaultButtonStyle.elevation,
      );
    } else {
      customButtonStyle = defaultButtonStyle;
    }

    return SizedBox(
      child: ElevatedButton(
        onPressed: (() => onPressed()),
        style: customButtonStyle,
        child: Text(
          text,
          style: customTextStyle,
        ),
      ),
    );
  }
}
