import 'package:flutter/material.dart';

double flexHeight(BuildContext context, double height) {
  return MediaQuery.of(context).size.height / 100 * height;
}

double flexWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width / 100 * width;
}
