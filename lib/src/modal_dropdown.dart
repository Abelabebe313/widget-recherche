import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:search/src/filters.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ModalDropDown extends StatefulWidget {
  const ModalDropDown({
    Key? key,
    required this.selected,
    required this.context,
    required this.onChanged,
    required this.valuesList,
    required this.fieldName,
    required this.modalDropdownPadding,
    required this.modalDropdownColor,
    required this.modalDropdownBorderRadius,
    required this.modalDropdownMenuColor,
    required this.modalDropdownMenuPadding,
    required this.modalDropdownIconSvgAsset,
    required this.modalDropdownIconColor,
    required this.modalDropdownIconSize,
    required this.modalDropdownIconPadding,
    required this.modalDropdownTypePadding,
    required this.modalDropdownTypeStyle,
    required this.modalDropdownMenuStyle,
    required this.modalDatepickerColor,
    required this.defaultValue,
    required this.type,
  }) : super(key: key);

  final String selected;
  final String defaultValue;
  final BuildContext context;
  final Function onChanged;
  final List<String> valuesList;
  final String fieldName;
  final EdgeInsets? modalDropdownPadding;
  final Color? modalDropdownColor;
  final double? modalDropdownBorderRadius;
  final Color? modalDropdownMenuColor;
  final EdgeInsets? modalDropdownMenuPadding;
  final String? modalDropdownIconSvgAsset;
  final Color? modalDropdownIconColor;
  final Size? modalDropdownIconSize;
  final EdgeInsets? modalDropdownIconPadding;
  final EdgeInsets? modalDropdownTypePadding;
  final TextStyle? modalDropdownTypeStyle;
  final TextStyle? modalDropdownMenuStyle;
  final FiltersType type;
  final Color modalDatepickerColor;

  @override
  State<ModalDropDown> createState() => _ModalDropDownState();
}

class _ModalDropDownState extends State<ModalDropDown> {
  late Widget iconSVG;
  late TextStyle defaultModalDropdownTypeStyle;
  late TextStyle? customModalDropdownTypeStyle;
  late TextStyle defaultModalDropdownMenuStyle;
  late TextStyle? customModalDropdownMenuStyle;

  @override
  void initState() {
    defaultModalDropdownTypeStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      fontSize: 12.sp,
    );
    customModalDropdownTypeStyle = widget.modalDropdownTypeStyle;
    if (customModalDropdownTypeStyle != null) {
      customModalDropdownTypeStyle = customModalDropdownTypeStyle!.copyWith(
        color: customModalDropdownTypeStyle!.color ?? defaultModalDropdownTypeStyle.color,
        fontFamily: customModalDropdownTypeStyle!.fontFamily ?? defaultModalDropdownTypeStyle.fontFamily,
        fontSize: customModalDropdownTypeStyle!.fontSize ?? defaultModalDropdownTypeStyle.fontSize,
        fontWeight: customModalDropdownTypeStyle!.fontWeight ?? defaultModalDropdownTypeStyle.fontWeight,
      );
    } else {
      customModalDropdownTypeStyle = defaultModalDropdownTypeStyle;
    }

    defaultModalDropdownMenuStyle = TextStyle(
      color: const Color.fromARGB(191, 2, 19, 43),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 13.sp,
      height: 1.4.h,
    );
    customModalDropdownMenuStyle = widget.modalDropdownMenuStyle;
    if (customModalDropdownMenuStyle != null) {
      customModalDropdownMenuStyle = customModalDropdownMenuStyle!.copyWith(
        color: customModalDropdownMenuStyle!.color ?? defaultModalDropdownMenuStyle.color,
        fontFamily: customModalDropdownMenuStyle!.fontFamily ?? defaultModalDropdownMenuStyle.fontFamily,
        fontSize: customModalDropdownMenuStyle!.fontSize ?? defaultModalDropdownMenuStyle.fontSize,
        fontWeight: customModalDropdownMenuStyle!.fontWeight ?? defaultModalDropdownMenuStyle.fontWeight,
        height: customModalDropdownMenuStyle!.height ?? defaultModalDropdownMenuStyle.height,
      );
    } else {
      customModalDropdownMenuStyle = defaultModalDropdownMenuStyle;
    }

    iconSVG = SvgPicture.asset(
      widget.modalDropdownIconSvgAsset ?? 'assets/dropdown.svg',
      width: widget.modalDropdownIconSize != null ? widget.modalDropdownIconSize!.width : 12.w,
      height: widget.modalDropdownIconSize != null ? widget.modalDropdownIconSize!.height : 7.h,
      package: widget.modalDropdownIconSvgAsset == null ? 'search' : null,
      color: widget.modalDropdownIconColor ?? const Color(0xFF02132B),
      semanticsLabel: 'Modal DropDown Icon',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.modalDropdownPadding ?? EdgeInsets.only(bottom: 15.h),
      child: Container(
        // height: 77.h,
        color: Colors.transparent,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: widget.modalDropdownTypePadding ?? EdgeInsets.only(bottom: 6.h),
                child: Text(
                  widget.fieldName,
                  style: customModalDropdownTypeStyle,
                ),
              ),
            ),
            GestureDetector(
              onTap: widget.type == FiltersType.datepicker
                  ? (() async {
                      await showDatePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: widget.modalDatepickerColor,
                              colorScheme: ColorScheme.light(primary: widget.modalDatepickerColor, secondary: widget.modalDatepickerColor),
                              buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary,
                              ),
                            ),
                            child: child!,
                          );
                        },
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        if (value != null) {
                          widget.valuesList.clear();
                          widget.valuesList.add(widget.defaultValue);
                          widget.valuesList.add(DateFormat('dd-MM-yyyy').format(value));
                          widget.onChanged(widget.valuesList.last);
                          setState(() {});
                        }
                      });
                    })
                  : (() {}),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.modalDropdownBorderRadius ?? 7.r),
                  ),
                  color: widget.modalDropdownColor ?? const Color.fromARGB(8, 2, 19, 43),
                ),
                width: double.infinity,
                height: 53.h,
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    dropdownColor: widget.modalDropdownMenuColor ?? Colors.white,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(
                      widget.modalDropdownBorderRadius ?? 7.r,
                    ),
                    underline: const SizedBox(),
                    icon: Padding(
                      padding: widget.modalDropdownIconPadding ?? EdgeInsets.only(right: 14.w, left: 10.w),
                      child: iconSVG,
                    ),
                    value: widget.selected,
                    items: widget.valuesList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: widget.modalDropdownMenuPadding ?? EdgeInsets.zero,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              value,
                              style: customModalDropdownMenuStyle,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: widget.type == FiltersType.datepicker
                        ? null
                        : (String? newValue) {
                            widget.onChanged(newValue);
                          },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
