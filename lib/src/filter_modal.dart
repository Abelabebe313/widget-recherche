import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:search/search.dart';
import 'package:search/src/modal_dropdown.dart';
import 'package:search/src/rounded_button.dart';

Future<void> showFilterModal({
  required BuildContext context,
  required double? modalBorderRadius,
  required double? modalHeight,
  required Color? modalBackgroundColor,
  required EdgeInsets? modalInnerPadding,
  required Color? modalDividerColor,
  required Size? modalDividerSize,
  required EdgeInsets? modalDividerPadding,
  required double? modalDividerBorderRadius,
  required EdgeInsets? modalApplyButtonPadding,
  required String? modalApplyButtonText,
  required TextStyle? modalApplyButtonTextStyle,
  required ButtonStyle? modalApplyButtonStyle,
  required Function(String) modalApplyOnPressed,
  required String? modalResetButtonText,
  required EdgeInsets? modalResetButtonPadding,
  required ButtonStyle? modalResetButtonStyle,
  required TextStyle? modalResetButtonTextStyle,
  required List<Filters>? modalFiltersList,
  required Color? modalDropdownColor,
  required EdgeInsets? modalDropdownPadding,
  required double? modalDropdownBorderRadius,
  required EdgeInsets? modalDropdownMenuPadding,
  required TextStyle? modalDropdownMenuStyle,
  required String? modalDropdownIconSvgAsset,
  required Color? modalDropdownIconColor,
  required Size? modalDropdownIconSize,
  required EdgeInsets? modalDropdownIconPadding,
  required EdgeInsets? modalDropdownTypePadding,
  required TextStyle? modalDropdownTypeStyle,
  required String? modalTitle,
  required EdgeInsets? modalTitlePadding,
  required TextStyle? modalTitleStyle,
  required Color modalDatepickerColor,
}) {
  String selectedFiltersStr = '';

  ButtonStyle defaultModalResetButtonStyle = ButtonStyle(
    splashFactory: NoSplash.splashFactory,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: MaterialStateProperty.all(EdgeInsets.zero),
    minimumSize: MaterialStateProperty.all(const Size(0, 0)),
  );
  ButtonStyle? customModalResetButtonStyle = modalResetButtonStyle;
  if (customModalResetButtonStyle != null) {
    customModalResetButtonStyle = customModalResetButtonStyle.copyWith(
      minimumSize: customModalResetButtonStyle.minimumSize ??
          defaultModalResetButtonStyle.minimumSize,
      padding: customModalResetButtonStyle.padding ??
          defaultModalResetButtonStyle.padding,
      tapTargetSize: customModalResetButtonStyle.tapTargetSize ??
          defaultModalResetButtonStyle.tapTargetSize,
      splashFactory: customModalResetButtonStyle.splashFactory ??
          defaultModalResetButtonStyle.splashFactory,
    );
  } else {
    customModalResetButtonStyle = defaultModalResetButtonStyle;
  }

  TextStyle defaultModalResetButtonTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
  TextStyle? customModalResetButtonTextStyle = modalResetButtonTextStyle;
  if (customModalResetButtonTextStyle != null) {
    customModalResetButtonTextStyle = customModalResetButtonTextStyle.copyWith(
      color: customModalResetButtonTextStyle.color ??
          customModalResetButtonTextStyle.color,
      fontFamily: customModalResetButtonTextStyle.fontFamily ??
          customModalResetButtonTextStyle.fontFamily,
      fontSize: customModalResetButtonTextStyle.fontSize ??
          customModalResetButtonTextStyle.fontSize,
      fontWeight: customModalResetButtonTextStyle.fontWeight ??
          customModalResetButtonTextStyle.fontWeight,
    );
  } else {
    customModalResetButtonTextStyle = defaultModalResetButtonTextStyle;
  }

  TextStyle defaultModalTitleStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 17.sp,
  );
  TextStyle? customModalTitleStyle = modalTitleStyle;
  if (customModalTitleStyle != null) {
    customModalTitleStyle.copyWith(
      fontSize:
          customModalTitleStyle.fontSize ?? defaultModalTitleStyle.fontSize,
      fontFamily:
          customModalTitleStyle.fontFamily ?? defaultModalTitleStyle.fontFamily,
      color: customModalTitleStyle.color ?? defaultModalTitleStyle.color,
      fontWeight:
          customModalTitleStyle.fontWeight ?? defaultModalTitleStyle.fontWeight,
    );
  } else {
    customModalTitleStyle = defaultModalTitleStyle;
  }

  void _setFilterCount() {
    if (modalFiltersList != null) {
      int selectedFilters = 0;
      for (int j = 0; j < modalFiltersList.length; j++) {
        if (modalFiltersList[j].valueChoose !=
                modalFiltersList[j].defaultValue &&
            modalFiltersList[j].valueChoose.isNotEmpty) {
          selectedFilters++;
        }
      }
      if (selectedFilters > 0) {
        selectedFiltersStr = ' (' + selectedFilters.toString() + ')';
      } else {
        selectedFiltersStr = '';
      }
    }
  }

  _setFilterCount();

  ButtonStyle defaultModalApplyButtonStyle = ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(317.w, 57.h)),
    backgroundColor: MaterialStateProperty.all(const Color(0xFF02132B)),
  );
  ButtonStyle? customModalApplyButtonStyle = modalApplyButtonStyle;
  if (customModalApplyButtonStyle != null) {
    customModalApplyButtonStyle = customModalApplyButtonStyle.copyWith(
      minimumSize: modalApplyButtonStyle?.minimumSize ??
          defaultModalApplyButtonStyle.minimumSize,
      backgroundColor: modalApplyButtonStyle?.backgroundColor ??
          defaultModalApplyButtonStyle.backgroundColor,
    );
  } else {
    customModalApplyButtonStyle = defaultModalApplyButtonStyle;
  }

  return showMaterialModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(modalBorderRadius ?? 40.r),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          List<Widget>? modalDropDownList;
          if (modalFiltersList != null) {
            modalDropDownList = [];
            List<List<Widget>>? shrinkList = [];
            int shrinkIndex = 0;
            shrinkList.add([]);
            for (int i = 0; i < modalFiltersList.length; i++) {
              if (modalFiltersList[i].shrink == false &&
                  shrinkList[shrinkIndex].isNotEmpty) {
                modalDropDownList.add(
                  Row(children: shrinkList[shrinkIndex]),
                );
                shrinkIndex++;
                shrinkList.add([]);
              } else if (modalFiltersList[i].shrink == true &&
                  shrinkList[shrinkIndex].isNotEmpty) {
                shrinkList[shrinkIndex].add(
                  SizedBox(width: 15.w),
                );
              }
              if (modalFiltersList[i].type == FiltersType.dropdown) {
                if (modalFiltersList[i].shrink == true) {
                  shrinkList[shrinkIndex].add(
                    Expanded(
                      child: ModalDropDown(
                        defaultValue: modalFiltersList[i].defaultValue,
                        modalDatepickerColor: modalDatepickerColor,
                        context: context,
                        onChanged: (String? newValue) {
                          setState(() {
                            modalFiltersList[i].valueChoose = newValue!;
                            _setFilterCount();
                          });
                        },
                        selected: modalFiltersList[i].valueChoose.isNotEmpty
                            ? modalFiltersList[i].valueChoose
                            : modalFiltersList[i].defaultValue,
                        valuesList: modalFiltersList[i].values!,
                        fieldName: modalFiltersList[i].fieldName,
                        modalDropdownMenuColor: modalBackgroundColor,
                        modalDropdownColor: modalDropdownColor,
                        modalDropdownPadding: modalDropdownPadding,
                        modalDropdownBorderRadius: modalDropdownBorderRadius,
                        modalDropdownMenuPadding: modalDropdownMenuPadding,
                        modalDropdownIconSvgAsset: modalDropdownIconSvgAsset,
                        modalDropdownIconColor: modalDropdownIconColor,
                        modalDropdownIconSize: modalDropdownIconSize,
                        modalDropdownIconPadding: modalDropdownIconPadding,
                        modalDropdownMenuStyle: modalDropdownMenuStyle,
                        modalDropdownTypeStyle: modalDropdownTypeStyle,
                        modalDropdownTypePadding: modalDropdownTypePadding,
                        type: modalFiltersList[i].type,
                      ),
                    ),
                  );
                } else {
                  modalDropDownList.add(
                    ModalDropDown(
                      defaultValue: modalFiltersList[i].defaultValue,
                      modalDatepickerColor: modalDatepickerColor,
                      context: context,
                      onChanged: (String? newValue) {
                        setState(() {
                          modalFiltersList[i].valueChoose = newValue!;
                          _setFilterCount();
                        });
                      },
                      selected: modalFiltersList[i].valueChoose.isNotEmpty
                          ? modalFiltersList[i].valueChoose
                          : modalFiltersList[i].defaultValue,
                      valuesList: modalFiltersList[i].values!,
                      fieldName: modalFiltersList[i].fieldName,
                      modalDropdownMenuColor: modalBackgroundColor,
                      modalDropdownColor: modalDropdownColor,
                      modalDropdownPadding: modalDropdownPadding,
                      modalDropdownBorderRadius: modalDropdownBorderRadius,
                      modalDropdownMenuPadding: modalDropdownMenuPadding,
                      modalDropdownIconSvgAsset: modalDropdownIconSvgAsset,
                      modalDropdownIconColor: modalDropdownIconColor,
                      modalDropdownIconSize: modalDropdownIconSize,
                      modalDropdownIconPadding: modalDropdownIconPadding,
                      modalDropdownMenuStyle: modalDropdownMenuStyle,
                      modalDropdownTypeStyle: modalDropdownTypeStyle,
                      modalDropdownTypePadding: modalDropdownTypePadding,
                      type: modalFiltersList[i].type,
                    ),
                  );
                }
              } else if (modalFiltersList[i].type == FiltersType.datepicker) {
                if (modalFiltersList[i].shrink == true) {
                  shrinkList[shrinkIndex].add(
                    Expanded(
                      child: ModalDropDown(
                        defaultValue: modalFiltersList[i].defaultValue,
                        modalDatepickerColor: modalDatepickerColor,
                        context: context,
                        onChanged: (String? newValue) {
                          setState(() {
                            modalFiltersList[i].valueChoose = newValue!;
                            _setFilterCount();
                          });
                        },
                        selected: modalFiltersList[i].valueChoose.isNotEmpty
                            ? modalFiltersList[i].valueChoose
                            : modalFiltersList[i].defaultValue,
                        valuesList: modalFiltersList[i].values!,
                        fieldName: modalFiltersList[i].fieldName,
                        modalDropdownMenuColor: modalBackgroundColor,
                        modalDropdownColor: modalDropdownColor,
                        modalDropdownPadding: modalDropdownPadding,
                        modalDropdownBorderRadius: modalDropdownBorderRadius,
                        modalDropdownMenuPadding: modalDropdownMenuPadding,
                        modalDropdownIconSvgAsset: modalDropdownIconSvgAsset,
                        modalDropdownIconColor: modalDropdownIconColor,
                        modalDropdownIconSize: modalDropdownIconSize,
                        modalDropdownIconPadding: modalDropdownIconPadding,
                        modalDropdownMenuStyle: modalDropdownMenuStyle,
                        modalDropdownTypeStyle: modalDropdownTypeStyle,
                        modalDropdownTypePadding: modalDropdownTypePadding,
                        type: modalFiltersList[i].type,
                      ),
                    ),
                  );
                } else {
                  modalDropDownList.add(
                    ModalDropDown(
                      defaultValue: modalFiltersList[i].defaultValue,
                      modalDatepickerColor: modalDatepickerColor,
                      context: context,
                      onChanged: (String? newValue) {
                        setState(() {
                          modalFiltersList[i].valueChoose = newValue!;
                          _setFilterCount();
                        });
                      },
                      selected: modalFiltersList[i].valueChoose.isNotEmpty
                          ? modalFiltersList[i].valueChoose
                          : modalFiltersList[i].defaultValue,
                      valuesList: modalFiltersList[i].values!,
                      fieldName: modalFiltersList[i].fieldName,
                      modalDropdownMenuColor: modalBackgroundColor,
                      modalDropdownColor: modalDropdownColor,
                      modalDropdownPadding: modalDropdownPadding,
                      modalDropdownBorderRadius: modalDropdownBorderRadius,
                      modalDropdownMenuPadding: modalDropdownMenuPadding,
                      modalDropdownIconSvgAsset: modalDropdownIconSvgAsset,
                      modalDropdownIconColor: modalDropdownIconColor,
                      modalDropdownIconSize: modalDropdownIconSize,
                      modalDropdownIconPadding: modalDropdownIconPadding,
                      modalDropdownMenuStyle: modalDropdownMenuStyle,
                      modalDropdownTypeStyle: modalDropdownTypeStyle,
                      modalDropdownTypePadding: modalDropdownTypePadding,
                      type: modalFiltersList[i].type,
                    ),
                  );
                }
              }
            }
            if (shrinkList[shrinkIndex].isNotEmpty) {
              modalDropDownList.add(
                Row(children: shrinkList[shrinkIndex]),
              );
            }
          }

          return Container(
            width: double.infinity,
            color: modalBackgroundColor ?? Colors.white,
            child: Padding(
              padding: modalInnerPadding ??
                  EdgeInsets.symmetric(horizontal: 29.w, vertical: 13.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: modalDividerPadding ?? EdgeInsets.zero,
                    child: Container(
                      height: modalDividerSize != null
                          ? modalDividerSize.height
                          : 5.h,
                      width: modalDividerSize != null
                          ? modalDividerSize.width
                          : 41.w,
                      decoration: BoxDecoration(
                        color: modalDividerColor ?? const Color(0xFFE2E2E2),
                        borderRadius: BorderRadius.circular(
                            modalDividerBorderRadius ?? 4.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: modalTitlePadding ??
                        EdgeInsets.fromLTRB(0, 17.h, 0, 21.h),
                    child: Text(
                      modalTitle != null
                          ? modalTitle + selectedFiltersStr
                          : 'Filtrer la recherche' + selectedFiltersStr,
                      style: customModalTitleStyle,
                    ),
                  ),
                  modalDropDownList != null
                      ? ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 450.h, minHeight: 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            children: modalDropDownList,
                          ),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: modalApplyButtonPadding ??
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 0),
                    child: RoundedButton(
                      text: modalApplyButtonText ?? 'Appliquer',
                      textStyle: modalApplyButtonTextStyle,
                      buttonStyle: customModalApplyButtonStyle,
                      onPressed: (() {
                        Navigator.pop(context);
                        modalApplyOnPressed(modalFiltersList?.map((e) => e.valueChoose).join(',') ?? "");
                      }),
                    ),
                  ),
                  Padding(
                    padding: modalResetButtonPadding ??
                        EdgeInsets.fromLTRB(0, 4.h, 0, 35.h),
                    child: TextButton(
                      onPressed: (() {
                        if (modalFiltersList != null) {
                          setState(() {
                            for (int i = 0; i < modalFiltersList.length; i++) {
                              modalFiltersList[i].valueChoose =
                                  modalFiltersList[i].defaultValue;
                            }
                            _setFilterCount();
                            Navigator.pop(context);
                            modalApplyOnPressed('');
                          });
                        }
                      }),
                      child: Text(
                        modalResetButtonText ?? 'Réinitialiser',
                        style: customModalResetButtonTextStyle,
                      ),
                      style: customModalResetButtonStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
