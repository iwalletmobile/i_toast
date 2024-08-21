import 'package:flutter/material.dart';

import 'itoast_message_widget.dart';

class CustomToastMessage extends IToastMessageWidget {
  final double? toastWidth;
  final double? toastHeight;
  final String? toastTitle;
  final String toastDescription;
  final Widget? toastTrailing;
  final VoidCallback onTapTrailing;
  final Widget? toastLeading;
  final Color? toastBackgroundColor;
  final Border? toastBorder;
  final Color? toastTextColor;
  final BorderRadius? toastBorderRadius;

  const CustomToastMessage({
    Key? key,
    this.toastWidth,
    this.toastHeight,
    this.toastTitle,
    required this.toastDescription,
    required this.toastTrailing,
    required this.onTapTrailing,
    required this.toastLeading,
    this.toastBackgroundColor,
    this.toastBorder,
    this.toastTextColor,
    this.toastBorderRadius,
  }) : super(
          key: key,
          title: toastTitle,
          description: toastDescription,
          backgroundColor: toastBackgroundColor,
          border: toastBorder,
          contentColor: toastTextColor ?? Colors.black,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
          borderRadius: toastBorderRadius,
          width: toastWidth,
          height: toastHeight,
        );
}
