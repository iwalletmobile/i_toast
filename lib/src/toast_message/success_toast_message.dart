import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class SuccessToastMessage extends IToastMessageWidget {
  final String toastTitle;
  final String toastSubtitle;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;

  SuccessToastMessage({
    Key? key,
    required this.toastTitle,
    required this.toastSubtitle,
    required this.toastTrailing,
    required this.onTapTrailing,
    required this.toastLeading,
  }) : super(
          key: key,
          title: toastTitle,
          subTitle: toastSubtitle,
          backgroundColor: ColorConstant.lightGreen,
          border: Border.all(
            color: ColorConstant.green,
          ),
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
