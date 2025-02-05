

import 'package:flutter/material.dart';

class ScheduleMacroModel{
  int? id;
  String? name;
  String? macroValue;
  String? macroUnit;
  String? iconPath;
  Color? iconColor;

  ScheduleMacroModel({
    this.id,
    this.name,
    this.macroValue,
    this.macroUnit,
    this.iconPath,
    this.iconColor
  });
}