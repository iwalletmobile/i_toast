import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget get addSize => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(width: 350, child: this),
      );
}
