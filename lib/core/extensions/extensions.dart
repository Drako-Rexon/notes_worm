import 'package:flutter/material.dart';

extension CustomSizedBox on int {
  SizedBox get ah => SizedBox(height: toDouble());
  SizedBox get aw => SizedBox(width: toDouble());
}
