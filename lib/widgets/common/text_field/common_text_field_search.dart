import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../const/constants.dart';
import '../inkwell/common_inkwell.dart';
import '../text/common_label.dart';


class CommonTextFieldSearch extends StatelessWidget {

  /// selected item value
  final String? selValue;

  /// items for selecting
  final List<String> items;

  /// callback when changing text. need refresh state if [bool] is true.
  final Function(String, bool)? onChanged;

  /// callback when pressed search
  final Function()? onSearch;

  /// keyboard type
  final TextInputType keyboardType;

  /// border color
  final Color borderColor;

  /// text color
  final Color textColor;

  /// text size
  final double textSize;

  /// min lines
  final int? minLines;

  /// max lines
  final int? maxLines;

  /// enabled
  final bool? enabled;

  /// filled text field
  final bool filled;

  /// fill color
  final Color fillColor;

  const CommonTextFieldSearch({
    Key? key,
    this.selValue,
    this.items = const [],
    this.onChanged,
    this.onSearch,
    this.keyboardType = TextInputType.text,
    this.borderColor =  Constants.whiteDark,
    this.textColor = Constants.textPrimaryDark,
    this.textSize = Constants.fntNormalSize,
    this.minLines,
    this.maxLines,
    this.enabled,
    this.filled = true,
    this.fillColor = Constants.whiteDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const borderWidth = 1.0;
    const borderRadius = Constants.editRadius;
    const double vPadding = 11;
    const double hPadding = Constants.textContainerPaddingH;

    return TextField(
      controller: TextEditingController(text: selValue),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value, false);
        }
      },
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        filled: true,
        fillColor: fillColor,
        hintText: 'Where to?',
        hintStyle: const TextStyle(
          color: Constants.textPrimaryDark,
        ),
        prefixIcon: CommonInkWell(
          onTap: onSearch,
          child: const Icon(Icons.search,
            color: Constants.textPrimaryDark,
          ),
        ),
        suffixIcon: SizedBox(
          width: 100,
          child: CommonInkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(CupertinoIcons.clock,
                  color: Constants.textPrimaryDark,
                ),
                const SizedBox(width: 5,),
                const CommonLabel('Now',
                  color: Constants.textPrimaryDark,
                ),
                const SizedBox(width: 5,),
                Icon(Icons.keyboard_arrow_down,
                  color: borderColor,
                ),
                const SizedBox(width: 5,),
              ],
            ),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Future.delayed(const Duration(milliseconds: 300), () {

                showCalendarDatePicker2Dialog(
                  context: context,
                  config: CalendarDatePicker2WithActionButtonsConfig(),
                  dialogSize: const Size(300, 300),
                  borderRadius: BorderRadius.circular(5),

                ).then((value) {
                  if (value != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(value[0]!);
                    if (onChanged != null) {
                      onChanged!(formattedDate, true);
                    }
                  }
                });

              });
            },
          ),
        ),
      ),
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
      maxLines: maxLines,
      minLines: minLines,
    );
  }

}