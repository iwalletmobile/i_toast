import 'package:flutter/material.dart';

import 'itoast_message_widget.dart';

class CustomToastMessage extends IToastMessageWidget {
  final double? toastWidth;
  final double? toastHeight;
  final String toastTitle;
  final String toastSubtitle;
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
    required this.toastTitle,
    required this.toastSubtitle,
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
          subTitle: toastSubtitle,
          backgroundColor: toastBackgroundColor,
          border: toastBorder,
          textColor: toastTextColor,
          trailing: toastTrailing,
          onTap: onTapTrailing,
          leading: toastLeading,
          borderRadius: toastBorderRadius,
          width: toastWidth,
          height: toastHeight,
        );
}
