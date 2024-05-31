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
          contentColor: ColorConstants.statesError.shade300,
          border: Border.all(color: ColorConstants.statesError.shade200),
          backgroundColor: ColorConstants.statesError.shade100,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
