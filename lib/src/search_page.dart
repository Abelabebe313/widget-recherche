import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search/src/filter_modal.dart';
import 'package:search/src/filters.dart';
import 'package:search/src/no_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.searchBarController,
    required this.result,
    required this.onChanged,
    this.onSubmitted,
    this.onPop,
    this.bodyPadding,
    this.backgroundColor = Colors.white,
    this.title = 'Recherche',
    this.titleStyle,
    this.backButtonIconSvgAsset,
    this.backButtonIconColor = Colors.black,
    this.backButtonSize,
    this.backButtonSplashRadius,
    this.backButtonPadding,
    this.searchBarPrefixIconSvgAsset,
    this.searchBarPrefixIconColor = const Color(0xFFBEBEBE),
    this.searchBarPrefixIconSize,
    this.searchBarPrefixIconPadding,
    this.searchBarSuffixIconSvgAsset,
    this.searchBarSuffixIconColor = const Color(0xFFBBBBBB),
    this.searchBarSuffixIconSize,
    this.searchBarSuffixIconPadding,
    this.searchBarSuffixIconSplashRadius,
    this.searchBarSettingsIconSvgAsset,
    this.searchBarSettingsIconColor = Colors.black,
    this.searchBarSettingsIconSize,
    this.searchBarSettingsIconPadding,
    this.searchBarSettingsIconSplashRadius,
    this.searchBarHint = 'Rechercher',
    this.searchBarHintStyle,
    this.searchBarColor = const Color(0xFFF6F6F6),
    this.searchBarBorderRadius,
    this.searchBarCursorColor = const Color(0xFF02132B),
    this.searchBarPadding,
    this.searchBarInputStyle,
    this.isSettings = true,
    this.modalBorderRadius,
    this.modalHeight,
    this.modalBackgroundColor,
    this.modalInnerPadding,
    this.modalDividerColor,
    this.modalDividerSize,
    this.modalDividerPadding,
    this.modalDividerBorderRadius,
    this.modalApplyButtonPadding,
    this.modalApplyButtonText,
    this.modalApplyButtonTextStyle,
    this.modalApplyButtonStyle,
    this.modalResetButtonText,
    this.modalResetButtonPadding,
    this.modalResetButtonStyle,
    this.modalResetButtonTextStyle,
    this.modalTitlePadding,
    this.modalTitle,
    this.modalTitleStyle,
    this.modalFiltersList,
    this.modalDropdownColor,
    this.modalDropdownPadding,
    this.modalDropdownBorderRadius,
    this.modalDropdownMenuStyle,
    this.modalDropdownMenuPadding,
    this.modalDropdownIconSvgAsset,
    this.modalDropdownIconColor,
    this.modalDropdownIconSize,
    this.modalDropdownIconPadding,
    this.modalDropdownTypeStyle,
    this.modalDropdownTypePadding,
    this.filtersListItemsPadding,
    this.filtersListColor = Colors.white,
    this.filtersListBorderColor = const Color(0xFFD8D8D8),
    this.filtersListBorderRadius,
    this.filtersListInnerPadding,
    this.filtersListStyle,
    this.filtersListButtonSize,
    this.filtersListButtonSplashRadius,
    this.filtersListButtonColor = const Color.fromARGB(120, 0, 0, 0),
    this.filtersListIconSvgAsset,
    this.filtersListButtonPadding,
    this.filtersListPadding,
    this.filtersListSize,
    this.onApply,
    this.noResult = const NoResult(),
    this.child,
    this.modalDatepickerColor = const Color(0xFF02132B),
    this.childrenPadding,
  }) : super(key: key);

  final bool result;
  final TextEditingController searchBarController;
  final ValueChanged<String> onChanged;
  final Function(String)? onSubmitted;


  final Function? onPop;
  final EdgeInsets? bodyPadding;
  final Color backgroundColor;
  final String title;
  final TextStyle? titleStyle;
  final String? backButtonIconSvgAsset;
  final Color backButtonIconColor;
  final Size? backButtonSize;
  final double? backButtonSplashRadius;
  final EdgeInsets? backButtonPadding;
  final String? searchBarPrefixIconSvgAsset;
  final Color searchBarPrefixIconColor;
  final Size? searchBarPrefixIconSize;
  final EdgeInsets? searchBarPrefixIconPadding;
  final String? searchBarSuffixIconSvgAsset;
  final Color searchBarSuffixIconColor;
  final Size? searchBarSuffixIconSize;
  final double? searchBarSuffixIconSplashRadius;
  final EdgeInsets? searchBarSuffixIconPadding;
  final String? searchBarSettingsIconSvgAsset;
  final Color searchBarSettingsIconColor;
  final Size? searchBarSettingsIconSize;
  final double? searchBarSettingsIconSplashRadius;
  final EdgeInsets? searchBarSettingsIconPadding;
  final String searchBarHint;
  final TextStyle? searchBarHintStyle;
  final Color searchBarColor;
  final double? searchBarBorderRadius;
  final Color searchBarCursorColor;
  final EdgeInsets? searchBarPadding;
  final TextStyle? searchBarInputStyle;
  final bool isSettings;
  final double? modalBorderRadius;
  final double? modalHeight;
  final Color? modalBackgroundColor;
  final EdgeInsets? modalInnerPadding;
  final Color? modalDividerColor;
  final Size? modalDividerSize;
  final EdgeInsets? modalDividerPadding;
  final double? modalDividerBorderRadius;
  final EdgeInsets? modalApplyButtonPadding;
  final String? modalApplyButtonText;
  final TextStyle? modalApplyButtonTextStyle;
  final ButtonStyle? modalApplyButtonStyle;
  final String? modalResetButtonText;
  final EdgeInsets? modalResetButtonPadding;
  final TextStyle? modalResetButtonTextStyle;
  final ButtonStyle? modalResetButtonStyle;
  final String? modalTitle;
  final EdgeInsets? modalTitlePadding;
  final TextStyle? modalTitleStyle;
  final List<Filters>? modalFiltersList;
  final Color? modalDropdownColor;
  final EdgeInsets? modalDropdownPadding;
  final double? modalDropdownBorderRadius;
  final EdgeInsets? modalDropdownMenuPadding;
  final TextStyle? modalDropdownMenuStyle;
  final String? modalDropdownIconSvgAsset;
  final Color? modalDropdownIconColor;
  final Size? modalDropdownIconSize;
  final EdgeInsets? modalDropdownIconPadding;
  final TextStyle? modalDropdownTypeStyle;
  final EdgeInsets? modalDropdownTypePadding;
  final EdgeInsets? filtersListItemsPadding;
  final Color filtersListColor;
  final Color filtersListBorderColor;
  final double? filtersListBorderRadius;
  final EdgeInsets? filtersListInnerPadding;
  final TextStyle? filtersListStyle;
  final double? filtersListButtonSize;
  final double? filtersListButtonSplashRadius;
  final Color filtersListButtonColor;
  final String? filtersListIconSvgAsset;
  final EdgeInsets? filtersListButtonPadding;
  final EdgeInsets? filtersListPadding;
  final Size? filtersListSize;
  final Function(String)? onApply;
  final Widget noResult;
  final Widget? child;
  final EdgeInsets? childrenPadding;
  final Color modalDatepickerColor;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _showClear = false;
  void _toggleClear() {
    setState(() {
      if (widget.searchBarController.text.isNotEmpty) {
        _showClear = true;
      } else {
        _showClear = false;
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (widget.onPop != null) {
      widget.onPop!();
    }
    return true;
  }

  void _applyFilters(String val) {
    setState(() {});
    if (widget.onApply != null) {
      widget.onApply!(val);
    }
  }

  @override
  void initState() {
    widget.searchBarController.addListener(_toggleClear);
    super.initState();
  }

  @override
  void dispose() {
    widget.searchBarController.removeListener(_toggleClear);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle defaultFiltersListStyle = TextStyle(
      fontSize: 10.sp,
      color: Colors.black.withOpacity(0.65),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
    TextStyle? customFiltersListStyle = widget.filtersListStyle;
    if (customFiltersListStyle != null) {
      customFiltersListStyle = customFiltersListStyle.copyWith(
        fontSize: customFiltersListStyle.fontSize ?? defaultFiltersListStyle.fontSize,
        color: customFiltersListStyle.color ?? defaultFiltersListStyle.color,
        fontFamily: customFiltersListStyle.fontFamily ?? defaultFiltersListStyle.fontFamily,
        fontWeight: customFiltersListStyle.fontWeight ?? defaultFiltersListStyle.fontWeight,
      );
    } else {
      customFiltersListStyle = defaultFiltersListStyle;
    }

    TextStyle defaultTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 17.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
    TextStyle? customTitleStyle = widget.titleStyle;
    if (customTitleStyle != null) {
      customTitleStyle = customTitleStyle.copyWith(
        color: customTitleStyle.color ?? defaultTitleStyle.color,
        fontSize: customTitleStyle.fontSize ?? defaultTitleStyle.fontSize,
        fontFamily: customTitleStyle.fontFamily ?? defaultTitleStyle.fontFamily,
        fontWeight: customTitleStyle.fontWeight ?? defaultTitleStyle.fontWeight,
      );
    } else {
      customTitleStyle = defaultTitleStyle;
    }

    TextStyle defaultSearchBarHintStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: const Color.fromARGB(64, 14, 14, 14),
      fontFamily: 'Poppins',
      fontSize: 13.sp,
      height: 1.5.h,
    );
    TextStyle? customSearchBarHintStyle = widget.searchBarHintStyle;
    if (customSearchBarHintStyle != null) {
      customSearchBarHintStyle = customSearchBarHintStyle.copyWith(
        color: customSearchBarHintStyle.color ?? defaultSearchBarHintStyle.color,
        fontFamily: customSearchBarHintStyle.fontFamily ?? defaultSearchBarHintStyle.fontFamily,
        fontSize: customSearchBarHintStyle.fontSize ?? defaultSearchBarHintStyle.fontSize,
        fontWeight: customSearchBarHintStyle.fontWeight ?? defaultSearchBarHintStyle.fontWeight,
        height: customSearchBarHintStyle.height ?? defaultSearchBarHintStyle.height,
      );
    } else {
      customSearchBarHintStyle = defaultSearchBarHintStyle;
    }

    TextStyle defaultSearchBarInputStyle = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: 13.sp,
    );
    TextStyle? customSearchBarInputStyle = widget.searchBarInputStyle;
    if (customSearchBarInputStyle != null) {
      customSearchBarInputStyle = customSearchBarInputStyle.copyWith(
        color: customSearchBarInputStyle.color ?? defaultSearchBarInputStyle.color,
        fontFamily: customSearchBarInputStyle.fontFamily ?? defaultSearchBarInputStyle.fontFamily,
        fontSize: customSearchBarInputStyle.fontSize ?? defaultSearchBarInputStyle.fontSize,
        fontWeight: customSearchBarInputStyle.fontWeight ?? defaultSearchBarInputStyle.fontWeight,
      );
    } else {
      customSearchBarInputStyle = defaultSearchBarInputStyle;
    }

    Size backButtonSize = widget.backButtonSize ?? Size(20.w, 19.h);
    final Widget backButtonSVG = SvgPicture.asset(
      widget.backButtonIconSvgAsset ?? 'assets/back_arrow.svg',
      width: backButtonSize.width,
      height: backButtonSize.height,
      package: widget.backButtonIconSvgAsset == null ? 'search' : null,
      color: widget.backButtonIconColor,
      semanticsLabel: 'Search BackButton Icon',
    );

    Size searchBarPrefixIconSize = widget.searchBarPrefixIconSize ?? Size(21.17.w, 21.17.w);
    final Widget searchBarPrefixSVG = SvgPicture.asset(
      widget.searchBarPrefixIconSvgAsset ?? 'assets/searchmagn.svg',
      width: searchBarPrefixIconSize.width,
      height: searchBarPrefixIconSize.height,
      package: widget.searchBarPrefixIconSvgAsset == null ? 'search' : null,
      color: widget.searchBarPrefixIconColor,
      semanticsLabel: 'Search SearchBar PrefixIcon',
    );
    final Size searchBarSuffixIconSize = widget.searchBarSuffixIconSize ?? Size(13.w, 13.w);
    final Widget searchBarSuffixSVG = SvgPicture.asset(
      widget.searchBarSuffixIconSvgAsset ?? 'assets/clear.svg',
      width: searchBarSuffixIconSize.width,
      height: searchBarSuffixIconSize.height,
      package: widget.searchBarSuffixIconSvgAsset == null ? 'search' : null,
      color: widget.searchBarSuffixIconColor,
      semanticsLabel: 'Search SearchBar SuffixIcon',
    );
    final Widget searchBarSettingsSVG = SvgPicture.asset(
      widget.searchBarSettingsIconSvgAsset ?? 'assets/settings.svg',
      width: widget.searchBarSettingsIconSize != null ? widget.searchBarSettingsIconSize!.width : 25.24.w,
      height: widget.searchBarSettingsIconSize != null ? widget.searchBarSettingsIconSize!.height : 25.24.w,
      package: widget.searchBarSettingsIconSvgAsset == null ? 'search' : null,
      color: widget.searchBarSettingsIconColor,
      semanticsLabel: 'Search SearchBar SettingsIcon',
    );

    final Widget filtersListButtonSVG = SvgPicture.asset(
      widget.filtersListIconSvgAsset ?? 'assets/clear_filter.svg',
      width: 8.w,
      height: 8.w,
      package: widget.filtersListIconSvgAsset == null ? 'search' : null,
      color: widget.filtersListButtonColor,
      semanticsLabel: 'Search BackButton Icon',
    );

    List<Widget> filtersWidgetList = [];
    bool isFilters = false;
    if (widget.modalFiltersList != null) {
      for (int i = 0; i < widget.modalFiltersList!.length; i++) {
        if (widget.modalFiltersList![i].valueChoose != widget.modalFiltersList![i].defaultValue) {
          isFilters = true;
          filtersWidgetList.add(
            Padding(
              padding: widget.filtersListItemsPadding ?? EdgeInsets.only(right: 7.w),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.filtersListColor,
                  border: Border.all(color: widget.filtersListBorderColor),
                  borderRadius: BorderRadius.circular(widget.filtersListBorderRadius ?? 12.r),
                ),
                height: double.infinity,
                child: Padding(
                  padding: widget.filtersListInnerPadding ?? EdgeInsets.only(left: 10.w),
                  child: Row(
                    children: [
                      Text(
                        widget.modalFiltersList![i].fieldName + ' : ' + widget.modalFiltersList![i].valueChoose,
                        style: customFiltersListStyle,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(widget.filtersListBorderRadius ?? 12.r),
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: (() {
                            setState(() {
                              widget.modalFiltersList![i].valueChoose = widget.modalFiltersList![i].defaultValue;
                            });
                            if(widget.onSubmitted!=null)
                            widget.onSubmitted!(widget.searchBarController.text);
                          }),
                          splashRadius: widget.filtersListButtonSplashRadius ?? 8.r,
                          icon: filtersListButtonSVG,
                          padding: widget.filtersListButtonPadding ?? EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: widget.bodyPadding ?? EdgeInsets.fromLTRB(26.w, MediaQuery.of(context).padding.top +20.h, 26.w, 0),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Transform.translate(
                            offset: Offset(0, 5.h),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: customTitleStyle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: widget.backButtonPadding ?? EdgeInsets.zero,
                          child: InkWell(
                            overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                              width: 38.w,
                              height: 38.h,
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: backButtonSVG,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: widget.searchBarPadding ?? EdgeInsets.only(top: 22.h, bottom: 17.h),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                autofocus: true,
                                onSubmitted:widget.onSubmitted,
                                onChanged: (value) {
                                  widget.onChanged(value);
                                },
                                style: customSearchBarInputStyle,
                                controller: widget.searchBarController,
                                cursorColor: widget.searchBarCursorColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    top: customSearchBarInputStyle.fontSize! / 2,
                                  ),
                                  prefixIcon: Padding(
                                    padding: widget.searchBarPrefixIconPadding ?? EdgeInsets.fromLTRB(17.w, 0.h, 10.w, 0.h),
                                    child: searchBarPrefixSVG,
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minHeight: searchBarPrefixIconSize.height,
                                    minWidth: searchBarPrefixIconSize.width,
                                  ),
                                  suffixIcon: _showClear
                                      ? Padding(
                                          padding: widget.searchBarSuffixIconPadding ?? EdgeInsets.only(right: 14.w),
                                          child: SizedBox(
                                            height: searchBarSuffixIconSize.height * 2,
                                            width: searchBarSuffixIconSize.width * 2,
                                            child: Material(
                                              borderRadius: BorderRadius.circular(50.r),
                                              color: Colors.transparent,
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: widget.searchBarController.clear,
                                                splashRadius: 13.r,
                                                icon: searchBarSuffixSVG,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  suffixIconConstraints: BoxConstraints(
                                    minHeight: searchBarSuffixIconSize.height,
                                    minWidth: searchBarSuffixIconSize.width,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      widget.searchBarBorderRadius ?? 7.r,
                                    ),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  hintText: widget.searchBarHint,
                                  hintStyle: customSearchBarHintStyle,
                                  fillColor: widget.searchBarColor,
                                  filled: true,
                                ),
                              ),
                            ),
                            widget.isSettings
                                ? InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: (() {
                                      showFilterModal(
                                        modalDatepickerColor: widget.modalDatepickerColor,
                                        context: context,
                                        modalBorderRadius: widget.modalBorderRadius,
                                        modalHeight: widget.modalHeight,
                                        modalBackgroundColor: widget.modalBackgroundColor,
                                        modalInnerPadding: widget.modalInnerPadding,
                                        modalDividerColor: widget.modalDividerColor,
                                        modalDividerSize: widget.modalDividerSize,
                                        modalDividerPadding: widget.modalDividerPadding,
                                        modalDividerBorderRadius: widget.modalDividerBorderRadius,
                                        modalApplyButtonPadding: widget.modalApplyButtonPadding,
                                        modalApplyButtonText: widget.modalApplyButtonText,
                                        modalApplyButtonTextStyle: widget.modalApplyButtonTextStyle,
                                        modalDropdownTypeStyle: widget.modalDropdownTypeStyle,
                                        modalDropdownMenuStyle: widget.modalDropdownMenuStyle,
                                        modalApplyButtonStyle: widget.modalApplyButtonStyle,
                                        modalApplyOnPressed: _applyFilters,
                                        modalResetButtonText: widget.modalResetButtonText,
                                        modalResetButtonPadding: widget.modalResetButtonPadding,
                                        modalResetButtonStyle: widget.modalResetButtonStyle,
                                        modalResetButtonTextStyle: widget.modalResetButtonTextStyle,
                                        modalTitle: widget.modalTitle,
                                        modalTitlePadding: widget.modalTitlePadding,
                                        modalTitleStyle: widget.modalTitleStyle,
                                        modalFiltersList: widget.modalFiltersList,
                                        modalDropdownColor: widget.modalDropdownColor,
                                        modalDropdownPadding: widget.modalDropdownPadding,
                                        modalDropdownBorderRadius: widget.modalDropdownBorderRadius,
                                        modalDropdownMenuPadding: widget.modalDropdownMenuPadding,
                                        modalDropdownIconSvgAsset: widget.modalDropdownIconSvgAsset,
                                        modalDropdownIconColor: widget.modalDropdownIconColor,
                                        modalDropdownIconSize: widget.modalDropdownIconSize,
                                        modalDropdownIconPadding: widget.modalDropdownIconPadding,
                                        modalDropdownTypePadding: widget.modalDropdownTypePadding,
                                      );
                                    }),
                                    child: Container(
                                      padding: widget.searchBarSettingsIconPadding ?? EdgeInsets.only(left: 8.8.w),
                                      child: searchBarSettingsSVG,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    isFilters
                        ? Padding(
                            padding: widget.filtersListPadding ?? EdgeInsets.only(top: 1.h, bottom: 23.w),
                            child: SizedBox(
                              width: widget.filtersListSize?.width ?? double.infinity,
                              height: widget.filtersListSize?.height ?? 33.h,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: filtersWidgetList,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Expanded(
                      child: Padding(
                        padding: widget.childrenPadding ?? EdgeInsets.zero,
                        child: SizedBox(
                          width: double.infinity,
                          child: widget.child == null || widget.result == false
                              ? ListView(
                                  children: [widget.noResult],
                                  physics: const BouncingScrollPhysics(),
                                )
                              : widget.child,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
       
      ),
    );
  }
}
