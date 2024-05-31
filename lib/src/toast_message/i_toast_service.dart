import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_toast/src/constants/string_constant.dart';

import '../enums/toast_type.dart';
import 'custom_toast_message.dart';
import 'error_toast_message.dart';
import 'info_toast_message.dart';
import 'itoast_message_widget.dart';
import 'success_toast_message.dart';
import 'warning_toast_message.dart';

/// Display a toast message with specified parameters.
///
/// Displays a toast message with a title, description, trailing widget,
/// and customizable appearance. Toast messages can be of type success,
/// error, info, warning, or custom.
///
/// * [context] The build context.
/// * [title] The title of the toast message.
/// * [description] The description of the toast message.
/// * [trailing] The widget to be displayed at the end of the toast message.
/// * [toastType] The type of toast message.
/// * [duration] The duration for which the toast message is displayed.
/// * [leading] The widget to be displayed at the start of the toast message.
/// * [toastBackgroundColor] The background color of the toast message.
/// * [toastBorderColor] The border color of the toast message.
/// * [toastBorderRadius] The border radius of the toast message.
/// * [toastWidth] The width of the toast message.
/// * [toastHeight] The height of the toast message.

class IToastService {
  /// Shows a Toast Message with an OverlayEntry on top of the screen
  /// ```dart
  /// ElevatedButton(
  ///             onPressed: () {
  ///               IToast.show(
  ///                 context,
  ///                 title: 'Information',
  ///                 description: 'Hello, World!',
  ///                 trailing: const Icon(Icons.close_rounded),
  ///                 toastType: ToastType.info,
  ///                 leading: leading,
  ///                 duration: Durations.extralong4,
  ///                 toastBackgroundColor: backgroundColor,
  ///                 toastBorder: border,
  ///                 toastBorderRadius: borderRadius,
  ///                 toastTextColor: textColor,
  ///               );
  ///             },
  ///             child: const Text('Show Toast'),
  ///           ),
  /// ```

  static void show(
    BuildContext context, {
    String? title,
    required String description,
    required ToastType toastType,
    Duration duration = const Duration(milliseconds: 7000),
    Widget? leading,
    Widget? trailing,
    Color? toastBackgroundColor,
    Border? toastBorder,
    Color? toastTextColor,
    BorderRadius? toastBorderRadius,
    double? toastWidth,
    double? toastHeight,
    VoidCallback? onTapTrailing,
  }) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 50,
          left: 12,
          right: 12,
          child: Material(
            type: MaterialType.transparency,
            child: _ToastMessageWidget(
              title: title,
              description: description,
              trailing: trailing,
              toastType: toastType,
              duration: duration,
              leading: leading,
              onDismissed: () {
                overlayEntry!.remove();
              },
              toastBackgroundColor: toastBackgroundColor,
              toastBorder: toastBorder,
              toastTextColor: toastTextColor,
              toastBorderRadius: toastBorderRadius,
              toastWidth: toastWidth,
              toastHeight: toastHeight,
              onTapTrailing: onTapTrailing,
            ),
          ),
        );
      },
    );

    final OverlayState? overlay = Overlay.maybeOf(context);

    if (overlay != null) {
      overlay.insert(overlayEntry);
    } else {
      Navigator.of(context).overlay?.insert(overlayEntry);
    }
  }
}

/// Internal widget for displaying the toast message.
class _ToastMessageWidget extends StatefulWidget {
  final String? title;
  final String description;
  final Widget? trailing;
  final Function onDismissed;
  final ToastType toastType;
  final Duration duration;
  final Widget? leading;
  final Color? toastBackgroundColor;
  final Border? toastBorder;
  final Color? toastTextColor;
  final BorderRadius? toastBorderRadius;
  final double? toastWidth;
  final double? toastHeight;
  final VoidCallback? onTapTrailing;

  const _ToastMessageWidget({
    Key? key,
    this.title,
    required this.onDismissed,
    required this.toastType,
    required this.description,
    required this.duration,
    required this.leading,
    this.trailing,
    this.toastBackgroundColor,
    this.toastBorder,
    this.toastTextColor,
    this.toastBorderRadius,
    this.toastWidth,
    this.toastHeight,
    this.onTapTrailing,
  })  : assert(
          toastType == ToastType.custom ||
              (toastBackgroundColor == null && toastBorder == null),
          StringConstant.assertMessage,
        ),
        super(key: key);

  @override
  _ToastMessageWidgetState createState() => _ToastMessageWidgetState();
}

/// State class for the toast message widget.
class _ToastMessageWidgetState extends State<_ToastMessageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationSlide;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationSlide =
        Tween<double>(begin: -1.0, end: 0.0).animate(_animationController);
    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future<void>.delayed(widget.duration).then((_) {
          _hide();
        });
      }
    });
    _show();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Show the toast message.
  void _show() {
    _animationController.forward();
  }

  /// Hide the toast message.
  void _hide() {
    _animationController.isDismissed
        ? null
        : _animationController.reverse().then((_) {
            widget.onDismissed();
          });
  }

  /// Find the appropriate toast widget based on the toast type.
  IToastMessageWidget _findToastWidget(
    ToastType toastType,
    String? title,
    String description,
    Widget? trailing,
    Widget? leading,
    Color? customBackgroundColor,
    Border? customBorder,
    Color? customTextColor,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    VoidCallback? onTapTrailing,
  ) {
    switch (toastType) {
      case ToastType.success:
        return SuccessToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
        );
      case ToastType.error:
        return ErrorToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
        );
      case ToastType.info:
        return InfoToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
        );
      case ToastType.warning:
        return WarningToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
        );
      case ToastType.custom:
        return CustomToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
          toastBackgroundColor: customBackgroundColor,
          toastBorder: customBorder,
          toastTextColor: customTextColor,
          toastBorderRadius: borderRadius,
          toastWidth: width,
          toastHeight: height,
        );
      default:
        return SuccessToastMessage(
          toastTitle: title,
          toastDescription: description,
          toastTrailing: trailing,
          onTapTrailing: onTapTrailing ?? _hide,
          toastLeading: leading,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        final double slideValue = _animationSlide.value;
        final double opacityValue = _animationOpacity.value;
        return Opacity(
          opacity: opacityValue,
          child: Transform.translate(
            offset: Offset(0.0, slideValue * 48),
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dy < 0) _hide();
              },
              child: _findToastWidget(
                widget.toastType,
                widget.title,
                widget.description,
                widget.trailing,
                widget.leading,
                widget.toastBackgroundColor,
                widget.toastBorder,
                widget.toastTextColor,
                widget.toastBorderRadius,
                widget.toastWidth,
                widget.toastHeight,
                widget.onTapTrailing,
              ),
            ),
          ),
        );
      },
    );
  }
}
