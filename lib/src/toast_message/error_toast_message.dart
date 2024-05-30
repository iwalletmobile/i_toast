import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class ErrorToastMessage extends IToastMessageWidget {
  final String toastTitle;
  final String toastSubTitle;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;

  ErrorToastMessage({
    Key? key,
    required this.toastTitle,
    required this.toastSubTitle,
    required this.toastTrailing,
    required this.onTapTrailing,
    required this.toastLeading,
  }) : super(
          key: key,
          title: toastTitle,
          subTitle: toastSubTitle,
          backgroundColor: ColorConstant.lightOrange,
          border: Border.all(
            color: ColorConstant.orange,
          ),
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
