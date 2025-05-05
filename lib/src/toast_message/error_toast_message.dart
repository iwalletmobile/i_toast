import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class ErrorToastMessage extends IToastMessageWidget {
  final String? toastTitle;
  final String toastDescription;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;
  final TextStyle? toastTitleStyle;
  final TextStyle? toastDescriptionStyle;

  ErrorToastMessage({
    Key? key,
    this.toastTitle,
    required this.toastDescription,
    required this.toastTrailing,
    required this.onTapTrailing,
    required this.toastLeading,
    this.toastTitleStyle,
    this.toastDescriptionStyle,
  }) : super(
          key: key,
          title: toastTitle,
          description: toastDescription,
          contentColor: ColorConstants.statesError.shade300,
          border: Border.all(color: ColorConstants.statesError.shade200),
          backgroundColor: ColorConstants.statesError.shade100,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
          titleStyle: toastTitleStyle,
          descriptionStyle: toastDescriptionStyle,
        );
}
