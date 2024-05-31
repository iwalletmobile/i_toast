import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import 'itoast_message_widget.dart';

class InfoToastMessage extends IToastMessageWidget {
  final String? toastTitle;
  final String toastDescription;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;

  InfoToastMessage({
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
          contentColor: ColorConstants.statesInfo.shade300,
          border: Border.all(color: ColorConstants.statesInfo.shade200),
          backgroundColor: ColorConstants.statesInfo.shade100,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
        );
}
