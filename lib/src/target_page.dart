import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search/src/loader_classic.dart';
import 'package:search/src/rounded_button.dart';

enum Target {
  iconbutton,
  searchbar,
  floatingbutton,
}

class TargetPage extends StatelessWidget {
  const TargetPage({
    Key? key,
    required this.target,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.targetIconButtonColor = const Color(0xFF02132B),
    this.targetIconButtonSvgAsset,
    this.targetIconButtonSize,
    this.targetIconButtonSplashRadius,
    this.targetFloatingButtonText = 'Rechercher',
    this.targetFloatingButtonTextStyle,
    this.targetFloatingButtonStyle,
    this.targetFloatingButtonBottomPadding,
    this.targetSearchBarBackgroundColor = const Color(0xFFF6F6F6),
    this.targetSearchBarPadding,
    this.targetSearchBarSize,
    this.targetSearchBarText = 'Rechercher',
    this.targetSearchBarIconSize,
    this.targetSearchBarBorderRadius,
    this.targetSearchBarIconColor = const Color(0xFFBEBEBE),
    this.targetSearchBarIconPadding,
    this.targetSearchBarSvgAsset,
    this.targetSearchBarTextStyle,
    this.avatarOnTap,
    this.avatarImage,
    this.avatarRadius,
    this.avatarSpinnerPadding,
    this.avatarSpinnerColor = const Color(0xFF02132B),
    this.title,
    this.titleStyle,
    this.topbarPadding,
    this.bodyPadding,
    this.child,
    this.childrenPadding,
    this.bottomNavigationBar,
  }) : super(key: key);

  final Target target;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color targetIconButtonColor;
  final String? targetIconButtonSvgAsset;
  final Size? targetIconButtonSize;
  final double? targetIconButtonSplashRadius;
  final String targetFloatingButtonText;
  final TextStyle? targetFloatingButtonTextStyle;
  final ButtonStyle? targetFloatingButtonStyle;
  final EdgeInsets? targetFloatingButtonBottomPadding;
  final Color targetSearchBarBackgroundColor;
  final EdgeInsets? targetSearchBarPadding;
  final Size? targetSearchBarSize;
  final String targetSearchBarText;
  final double? targetSearchBarBorderRadius;
  final Color targetSearchBarIconColor;
  final EdgeInsets? targetSearchBarIconPadding;
  final Size? targetSearchBarIconSize;
  final String? targetSearchBarSvgAsset;
  final TextStyle? targetSearchBarTextStyle;
  final VoidCallback? avatarOnTap;
  final String? avatarImage;
  final double? avatarRadius;
  final Color avatarSpinnerColor;
  final EdgeInsets? avatarSpinnerPadding;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsets? topbarPadding;
  final EdgeInsets? bodyPadding;
  final Widget? child;
  final EdgeInsets? childrenPadding;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTargetSearchBarTextStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(64, 14, 14, 14),
      fontSize: 13.sp,
      fontFamily: 'Poppins',
      height: 1.5.h,
    );
    TextStyle? customTargetSearchBarTextStyle = targetSearchBarTextStyle;
    if (customTargetSearchBarTextStyle != null) {
      customTargetSearchBarTextStyle = customTargetSearchBarTextStyle.copyWith(
        fontSize: customTargetSearchBarTextStyle.fontSize ??
            defaultTargetSearchBarTextStyle.fontSize,
        fontWeight: customTargetSearchBarTextStyle.fontWeight ??
            defaultTargetSearchBarTextStyle.fontWeight,
        fontFamily: customTargetSearchBarTextStyle.fontFamily ??
            defaultTargetSearchBarTextStyle.fontFamily,
        color: customTargetSearchBarTextStyle.color ??
            defaultTargetSearchBarTextStyle.color,
        height: customTargetSearchBarTextStyle.height ??
            defaultTargetSearchBarTextStyle.height,
      );
    } else {
      customTargetSearchBarTextStyle = defaultTargetSearchBarTextStyle;
    }

    final double defaultAvatarRadius = 22.w;
    final EdgeInsets defaultBodyPadding =
        EdgeInsets.fromLTRB(26.w, 33.h, 26.w, 0);
    final topbarWidth = MediaQuery.of(context).size.width -
        defaultBodyPadding.left -
        defaultBodyPadding.right;

    TextStyle defaultTitleStyle = TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
    TextStyle? customTitleStyle = titleStyle;
    if (customTitleStyle != null) {
      customTitleStyle = customTitleStyle.copyWith(
        fontSize: customTitleStyle.fontSize ?? defaultTitleStyle.fontSize,
        fontWeight: customTitleStyle.fontWeight ?? defaultTitleStyle.fontWeight,
        fontFamily: customTitleStyle.fontFamily ?? defaultTitleStyle.fontFamily,
      );
    } else {
      customTitleStyle = defaultTitleStyle;
    }

    ButtonStyle defaultTargetFloatingButtonStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(155.w, 43.h)),
    );
    ButtonStyle? customTargetFloatingButtonStyle = targetFloatingButtonStyle;
    if (customTargetFloatingButtonStyle != null) {
      customTargetFloatingButtonStyle =
          customTargetFloatingButtonStyle.copyWith(
        minimumSize: customTargetFloatingButtonStyle.minimumSize ??
            defaultTargetFloatingButtonStyle.minimumSize,
      );
    } else {
      customTargetFloatingButtonStyle = defaultTargetFloatingButtonStyle;
    }

    final Widget targetSearchBarSVG = SvgPicture.asset(
      targetSearchBarSvgAsset ?? 'assets/searchmagn.svg',
      width: targetSearchBarIconSize?.width ?? 21.17.w,
      height: targetSearchBarIconSize?.height ?? 21.17.w,
      package: targetSearchBarSvgAsset == null ? 'search' : null,
      color: targetSearchBarIconColor,
      semanticsLabel: 'Target SearchBar Icon',
    );

    final Widget targetIconButtonSVG = SvgPicture.asset(
      targetIconButtonSvgAsset ?? 'assets/searchmagn.svg',
      width: targetIconButtonSize?.width ?? 24.w,
      height: targetIconButtonSize?.height ?? 24.w,
      package: targetIconButtonSvgAsset == null ? 'search' : null,
      color: targetIconButtonColor,
      semanticsLabel: 'Target IconButton Icon',
    );

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar ?? const SizedBox(),
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: bodyPadding ?? defaultBodyPadding,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            avatarImage != null ||
                                    title != null ||
                                    target == Target.iconbutton
                                ? Padding(
                                    padding: topbarPadding ??
                                        EdgeInsets.only(bottom: 8.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        avatarImage != null
                                            ? Container(
                                                alignment: Alignment.centerLeft,
                                                height: (avatarRadius ??
                                                        defaultAvatarRadius) *
                                                    2,
                                                width: topbarWidth / 6,
                                                child: GestureDetector(
                                                  onTap: avatarOnTap,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        backgroundColor,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r),
                                                      child: CachedNetworkImage(
                                                        imageUrl: avatarImage!,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder:
                                                            (context, url) =>
                                                                FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Padding(
                                                            padding:
                                                                avatarSpinnerPadding ??
                                                                    EdgeInsets
                                                                        .all(20
                                                                            .w),
                                                            child:
                                                                LoaderClassic(
                                                              activeColor:
                                                                  avatarSpinnerColor,
                                                            ),
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Icon(
                                                            Icons.error,
                                                            size: (avatarRadius ??
                                                                    defaultAvatarRadius) *
                                                                2,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    radius: avatarRadius ??
                                                        defaultAvatarRadius,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: topbarWidth / 6),
                                        const Spacer(),
                                        title != null
                                            ? Container(
                                                alignment: Alignment.center,
                                                height: (avatarRadius ??
                                                        defaultAvatarRadius) *
                                                    2,
                                                width: topbarWidth / 6 * 3.5,
                                                child: Text(
                                                  title!,
                                                  style: customTitleStyle,
                                                ),
                                              )
                                            : SizedBox(
                                                width: topbarWidth / 6 * 3.5),
                                        const Spacer(),
                                        target == Target.iconbutton
                                            ? Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                height: (avatarRadius ??
                                                        defaultAvatarRadius) *
                                                    2,
                                                width: topbarWidth / 6,
                                                child: Transform.translate(
                                                  offset: Offset(11.w, 0),
                                                  child: IconButton(
                                                    onPressed: onPressed,
                                                    splashRadius:
                                                        targetIconButtonSplashRadius ??
                                                            23.r,
                                                    icon: targetIconButtonSVG,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: topbarWidth / 6),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            target == Target.searchbar
                                ? Padding(
                                    padding: targetSearchBarPadding ??
                                        EdgeInsets.only(top: 3.h, bottom: 11.h),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          borderRadius: BorderRadius.circular(
                                            targetSearchBarBorderRadius ?? 7.r,
                                          ),
                                          onTap: onPressed,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                targetSearchBarBorderRadius ??
                                                    7.r,
                                              ),
                                              color:
                                                  targetSearchBarBackgroundColor,
                                            ),
                                            alignment: Alignment.centerLeft,
                                            height:
                                                targetSearchBarSize?.height ??
                                                    50.h,
                                            width: targetSearchBarSize?.width ??
                                                double.infinity,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      targetSearchBarIconPadding ??
                                                          EdgeInsets.fromLTRB(
                                                              17.w,
                                                              0.h,
                                                              10.w,
                                                              0.h),
                                                  child: targetSearchBarSVG,
                                                ),
                                                Transform.translate(
                                                  offset: Offset(0, -1.h),
                                                  child: Text(
                                                    targetSearchBarText,
                                                    style:
                                                        customTargetSearchBarTextStyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  child != null
                      ? Expanded(
                          child: Padding(
                            padding: childrenPadding ?? EdgeInsets.zero,
                            child: SizedBox(
                              width: double.infinity,
                              child: child,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            target == Target.floatingbutton
                ? Padding(
                    padding: targetFloatingButtonBottomPadding ??
                        EdgeInsets.only(bottom: 49.h),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RoundedButton(
                        text: targetFloatingButtonText,
                        buttonStyle: customTargetFloatingButtonStyle,
                        textStyle: targetFloatingButtonTextStyle,
                        onPressed: onPressed,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
