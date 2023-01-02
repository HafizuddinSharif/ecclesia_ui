import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ElectionCard extends StatelessWidget {
  final ElectionStatusEnum status;
  final String electionTitle;
  final String electionDescription;
  final String electionOrganization;

  ElectionCard({
    Key? key,
    required this.status,
    required this.electionTitle,
    required this.electionDescription,
    required this.electionOrganization,
  }) : super(key: key);

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
    return InkWell(
      onTap: () {
        debugPrint('Container clicked!');
        context.go('/election-detail');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        // margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.14), //color of shadow
                spreadRadius: 0, //spread radius
                blurRadius: 10, // blur radius
                offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title for card
                Text(electionTitle,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: electionCardOptions[status]!.color,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(electionCardOptions[status]!.statusDesc,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            Text(electionOrganization, style: const TextStyle(fontStyle: FontStyle.italic)),
            // Link to see result
            // Render only when vote has been closed
            (status != ElectionStatusEnum.voteClosed)
                ? Container()
                : SizedBox(
                    height: 25,
                    child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                        ),
                        onPressed: () {
                          debugPrint('Viewing result here');
                        },
                        child: const Text('Click here to view result',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ))),
                  ),
            Container(
              height: 8,
            ),
            // Election description
            Text(electionDescription, overflow: TextOverflow.ellipsis, maxLines: 2),
          ],
        ),
      ),
    );
  }
}
