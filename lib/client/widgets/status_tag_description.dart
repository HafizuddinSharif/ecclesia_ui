import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_card_model.dart';
import 'package:flutter/material.dart';

class StatusTagDescription extends StatelessWidget {
  final ElectionStatusEnum status;

  final Map<ElectionStatusEnum, ElectionCardModel> electionCardOptions = {
    ElectionStatusEnum.voteNotOpen: ElectionCardModel(statusTitle: 'Not open yet', color: Colors.orange, statusDesc: "Election not ready yet", subtitle: "Wait for the election to open.", icon: Icons.error),
    ElectionStatusEnum.voteOpen: ElectionCardModel(statusTitle: 'Open to vote', color: Colors.green, statusDesc: "You can start voting now", subtitle: "Start voting by clicking the blue button at the bottom of the screen.", icon: Icons.dangerous_rounded),
    ElectionStatusEnum.voteEnding: ElectionCardModel(statusTitle: 'Ending in 5 hours', color: Colors.red, statusDesc: "Vote before the election ends", subtitle: "Start voting by clicking the blue button at the bottom of the page.", icon: Icons.pending_actions_rounded),
    ElectionStatusEnum.voteClosed: ElectionCardModel(statusTitle: 'Voting closed', color: Colors.black, statusDesc: "Voting period has ended", subtitle: "Thank you for joining.", icon: Icons.door_front_door_outlined),
    ElectionStatusEnum.voted: ElectionCardModel(statusTitle: 'You have voted', color: Colors.blue, statusDesc: "You have voted", subtitle: "Wait for the voting period to end to see the result.", icon: Icons.check_circle),
    ElectionStatusEnum.registeringDetails: ElectionCardModel(statusTitle: 'Registering your details', color: Colors.orange, statusDesc: "Registering your details", subtitle: "Wait for the system to register your credentials.", icon: Icons.badge_rounded),
    ElectionStatusEnum.castingBallot: ElectionCardModel(statusTitle: 'Casting your ballot', color: Colors.orange, statusDesc: "Casting your ballot", subtitle: "Wait for the system to process your ballot.", icon: Icons.av_timer_rounded),
  };

  StatusTagDescription({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            electionCardOptions[status]!.icon,
            size: 80,
            color: electionCardOptions[status]!.color,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(electionCardOptions[status]!.statusDesc,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
                Text(
                  electionCardOptions[status]!.subtitle,
                  softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
