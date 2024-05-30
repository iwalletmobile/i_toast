import 'package:flutter/material.dart';
import '../utils/extensions/context_extensions.dart';

class IToastMessageWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;
  final Widget? trailing;
  final VoidCallback onTap;
  final Widget? leading;
  final BorderRadius? borderRadius;

  const IToastMessageWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    this.width,
    this.height,
    this.border,
    this.backgroundColor,
    this.textColor,
    required this.trailing,
    required this.onTap,
    required this.leading,
    this.borderRadius,
  }) : super(
          key: key,
        );

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: leading,
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// MARK: Toast message başlık
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.black,
                      ),
                    ),

                    /// MARK: Toast message alt bilgi
                    SizedBox(
                      width: context.screenWidth * .62,
                      child: Text(subTitle),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (trailing != null)
            Padding(
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
        ],
      ),
    );
  }
}
