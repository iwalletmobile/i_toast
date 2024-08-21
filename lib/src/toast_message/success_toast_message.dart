import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class SuccessToastMessage extends IToastMessageWidget {
  final String? toastTitle;
  final String toastDescription;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;

  SuccessToastMessage({
    Key? key,
    this.toastTitle,
    required this.toastDescription,
    required this.toastTrailing,
    required this.onTapTrailing,
    required this.toastLeading,
  }) : super(
          key: key,
          title: toastTitle,
          description: toastDescription,
          contentColor: ColorConstants.statesSuccess.shade300,
          border: Border.all(color: ColorConstants.statesSuccess.shade200),
          backgroundColor: ColorConstants.statesSuccess.shade100,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
