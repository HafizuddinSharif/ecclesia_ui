import 'package:flutter/material.dart';

enum ElectionStatusEnum { voteNotOpen, voteOpen, voteEnding, voted, voteClosed, registeringDetails, castingBallot }

class ElectionOverviewModel {
  final String statusTitle;
  final Color color;
  final String statusDesc;
  final String subtitle;
  final IconData icon;

  ElectionOverviewModel({
    required this.statusTitle,
    required this.statusDesc,
    required this.color,
    required this.subtitle,
    required this.icon,
  });
}
