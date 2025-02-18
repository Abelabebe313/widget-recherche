import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoResult extends StatelessWidget {
  const NoResult({
    Key? key,
    this.fontFamily = 'Poppins',
    this.iconSvgAsset,
    this.iconScale,
    this.iconColor = Colors.white,
    this.iconBackgroundColor = const Color(0xFF02132B),
    this.title = 'Aucun résultat',
    this.titleColor = Colors.black,
    this.titleFontSize,
    this.titlePadding,
    this.description = 'Vous pouvez effectuer une\n recherche ci-dessus.',
    this.descriptionFontSize,
    this.descriptionColor = const Color(0xFF9F9F9F),
    this.padding,
    this.size,
    this.iconWidget,
  }) : super(key: key);

  final String fontFamily;
  final String? iconSvgAsset;
  final double? iconScale;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final Color titleColor;
  final double? titleFontSize;
  final EdgeInsets? titlePadding;
  final String description;
  final double? descriptionFontSize;
  final Color descriptionColor;
  final EdgeInsets? padding;
  final Size? size;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    final Widget iconSVG = SvgPicture.asset(
      iconSvgAsset ?? 'assets/no_result.svg',
      width: 24.w,
      height: 24.w,
      package: iconSvgAsset == null ? 'search' : null,
      color: iconColor,
      semanticsLabel: 'Icon NoResult',
    );

    return Align(
      child: Padding(
        padding: padding ?? EdgeInsets.only(top: 203.h),
        child: Container(
          constraints: BoxConstraints(
            minHeight: size != null ? size!.height : 132.h,
            minWidth: size != null ? size!.width : 254.w,
          ),
          child: Column(
            children: [
              Transform.scale(
                scale: iconScale ?? 1,
                child: iconWidget ??
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(16.w, -11.h),
                          child: Container(
                            width: 27.w,
                            height: 27.w,
                            decoration: BoxDecoration(
                              color: iconBackgroundColor.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Container(
                          width: 42.w,
                          height: 42.w,
                          child: Align(child: iconSVG),
                          decoration: BoxDecoration(
                            color: iconBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
              ),
              Padding(
                padding:
                    titlePadding ?? EdgeInsets.only(bottom: 4.h, top: 12.h),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                    fontSize: titleFontSize ?? 22.sp,
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w400,
                  color: descriptionColor,
                  fontSize: descriptionFontSize ?? 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
