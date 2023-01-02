import 'package:flutter/material.dart';

enum ElectionStatusEnum { voteNotOpen, voteOpen, voteEnding, voted, voteClosed, registeringDetails, castingBallot }

class ElectionOverviewModel {
  final String statusDesc;
  final Color color;

  ElectionOverviewModel(this.statusDesc, this.color);
}
