import 'package:flutter/material.dart';

class ElectionCardModel {
  final String statusTitle;
  final Color color;
  final String statusDesc;
  final String subtitle;
  final IconData icon;

  ElectionCardModel({
    required this.statusTitle,
    required this.statusDesc,
    required this.color,
    required this.subtitle,
    required this.icon,
  });
}
