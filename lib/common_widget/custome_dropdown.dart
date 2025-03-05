import 'package:barlew_app/constant/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class MyCustomDropdown extends StatefulWidget {
  final List<String> selectedValues;
  final List<String> dropDownValue;
  final Function(List<String>)? onTap;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;
  final double? height;
  final Color? hintColor;
  final Color? borderColor;
  final Color? dropdownfillColor;
  final double? hintFontSize;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Icon? icon;

  const MyCustomDropdown({
    super.key,
    required this.selectedValues,
    required this.dropDownValue,
    this.horizonPadding = 2,
    this.verticPadding = 0,
    this.hinttext,
    this.onTap,
    this.height,
    this.textStyle,
    this.icon,
    this.hintColor,
    this.hintFontSize,
    this.borderRadius,
    this.borderColor,
    this.dropdownfillColor,
  });

  @override
  State<MyCustomDropdown> createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends State<MyCustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Container(
          height: widget.height,
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizonPadding.w,
              vertical: widget.verticPadding.h),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius ?? 8.r)),
              border: Border.all(color: AppColors.cABABAB)),
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(
                  "${widget.hinttext}",
                  style: TextFontStyle.text12allPrimaryColorw400.copyWith(
                      color: widget.hintColor, fontSize: widget.hintFontSize),
                ),
                isExpanded: true,
                value: widget.selectedValues.isNotEmpty
                    ? widget.selectedValues.first
                    : null,
                icon: widget.icon ??
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 22.sp,
                      color: AppColors.c000000,
                    ),
                items: widget.dropDownValue
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Checkbox(
                          value: widget.selectedValues.contains(value),
                          onChanged: (bool? newValue) {
                            setState(() {
                              if (newValue != null) {
                                if (newValue) {
                                  widget.selectedValues.add(value);
                                } else {
                                  widget.selectedValues.remove(value);
                                }
                                widget.onTap?.call(widget.selectedValues);
                              }
                            });
                          },
                        ),
                        Text(
                          value,
                          style: widget.textStyle ??
                              TextFontStyle.text12allPrimaryColorw400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  // This is not needed anymore since we are handling checkbox selection
                },
                dropdownColor: widget.dropdownfillColor ?? AppColors.c22BB55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
