import 'package:flutter/material.dart';

import '../utils/extensions/context_extensions.dart';

class IToastMessageWidget extends StatelessWidget {
  final String? title;
  final String description;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color contentColor;
  final BoxBorder? border;
  final Widget? trailing;
  final VoidCallback onTap;
  final Widget? leading;
  final BorderRadius? borderRadius;

  const IToastMessageWidget({
    Key? key,
    this.title,
    required this.description,
    this.width,
    this.height,
    this.border,
    this.backgroundColor,
    required this.contentColor,
    required this.trailing,
    required this.onTap,
    required this.leading,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.screenWidth,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.themeData.primaryColorLight,
        border: border,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -4),
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 32,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null)
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: title != null ? 20 : 13),
                child: leading,
              ),
            ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// MARK: Toast message başlık
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: contentColor,
                      ),
                    ),

                  /// MARK: Toast message alt bilgi
                  Text(
                    description,
                    style: TextStyle(color: contentColor),
                  ),
                ],
              ),
            ),
          ),
          if (trailing != null)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: InkWell(
                  onTap: onTap,
                  child: trailing,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
