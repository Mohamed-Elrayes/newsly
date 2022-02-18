import 'package:flutter/material.dart';

class IconSelectItem {
  String? label;
  IconData? icon;
  IconData? activeIcon;
  bool isSelected;
  IconSelectItem({
    this.label,
    this.icon,
    this.activeIcon,
    this.isSelected = false,
  });
}
