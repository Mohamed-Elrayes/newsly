import 'package:flutter/widgets.dart';
import '../../core/constants/icon_constant.dart';

class SettingModel {
  IconData iconLabel;
  String label;
  IconData iconData;
  SettingModel({
    required this.iconLabel,
    required this.label,
     this.iconData = arrowForwardIcon,
  });
}
