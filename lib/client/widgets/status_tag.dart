import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  StatusTag({
    Key? key,
    required this.status,
  }) : super(key: key);

  final ElectionStatusEnum status;

  final Map<ElectionStatusEnum, ElectionOverviewModel> electionCardOptions = {
    ElectionStatusEnum.voteNotOpen: ElectionOverviewModel(statusTitle: 'Not open yet', color: Colors.orange, statusDesc: "You have not voted yet", subtitle: "Wait for the election to open.", icon: Icons.error),
    ElectionStatusEnum.voteOpen: ElectionOverviewModel(statusTitle: 'Open to vote', color: Colors.green, statusDesc: "You have not voted yet", subtitle: "Start voting by clicking the blue button at the bottom of the screen.", icon: Icons.dangerous_rounded),
    ElectionStatusEnum.voteEnding: ElectionOverviewModel(statusTitle: 'Ending in 5 hours', color: Colors.red, statusDesc: "You have not voted yet", subtitle: "Start voting by clicking the blue button at the bottom of the page.", icon: Icons.pending_actions_rounded),
    ElectionStatusEnum.voteClosed: ElectionOverviewModel(statusTitle: 'Voting closed', color: Colors.black, statusDesc: "Voting period has ended", subtitle: "Thank you for joining.", icon: Icons.door_front_door_outlined),
    ElectionStatusEnum.voted: ElectionOverviewModel(statusTitle: 'You have voted', color: Colors.blue, statusDesc: "You have voted", subtitle: "Wait for the voting period to end to see the result.", icon: Icons.check_circle),
    ElectionStatusEnum.registeringDetails: ElectionOverviewModel(statusTitle: 'Registering your details', color: Colors.orange, statusDesc: "You have not voted yet", subtitle: "Wait for the system to register your credentials.", icon: Icons.badge_rounded),
    ElectionStatusEnum.castingBallot: ElectionOverviewModel(statusTitle: 'Casting your ballot', color: Colors.orange, statusDesc: "Processing ballot", subtitle: "Wait for the system to process your ballot.", icon: Icons.av_timer_rounded),
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
