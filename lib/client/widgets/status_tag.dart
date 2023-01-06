import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  StatusTag({
    Key? key,
    required this.status,
  }) : super(key: key);

  final ElectionStatusEnum status;

  final Map<ElectionStatusEnum, ElectionOverviewModel> electionCardOptions = {
    ElectionStatusEnum.voteNotOpen: ElectionOverviewModel('Not open yet', Colors.orange),
    ElectionStatusEnum.voteOpen: ElectionOverviewModel('Open to vote', Colors.green),
    ElectionStatusEnum.voteEnding: ElectionOverviewModel('Ending in 5 hours', Colors.red),
    ElectionStatusEnum.voteClosed: ElectionOverviewModel('Voting closed', Colors.black),
    ElectionStatusEnum.voted: ElectionOverviewModel('You have voted', Colors.blue),
    ElectionStatusEnum.registeringDetails: ElectionOverviewModel('Registering your details', Colors.orange),
    ElectionStatusEnum.castingBallot: ElectionOverviewModel('Casting your ballot', Colors.orange),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: electionCardOptions[status]!.color,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Text(
            electionCardOptions[status]!.statusDesc,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
