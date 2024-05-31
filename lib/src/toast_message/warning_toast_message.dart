import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class WarningToastMessage extends IToastMessageWidget {
  final Widget? toastTrailing;
  final String toastTitle;
  final String toastSubtitle;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;

  WarningToastMessage({
    Key? key,
    required this.toastTrailing,
    required this.toastTitle,
    required this.toastSubtitle,
    required this.onTapTrailing,
    required this.toastLeading,
  }) : super(
          key: key,
          title: toastTitle,
          subTitle: toastSubtitle,
          contentColor: ColorConstants.statesWarning.shade300,
          border: Border.all(color: ColorConstants.statesWarning.shade200),
          backgroundColor: ColorConstants.statesWarning.shade100,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
