import 'package:flutter/material.dart';

// Constants to represent the phase of an election
enum ElectionStatusEnum { voteNotOpen, voteOpen, voteEnding, voted, voteClosed, registeringDetails, castingBallot }

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
