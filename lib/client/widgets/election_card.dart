import 'package:ecclesia_ui/client/widgets/status_tag.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ElectionCard extends StatelessWidget {
  final String id;
  final ElectionStatusEnum status;
  final String electionTitle;
  final String electionDescription;
  final String electionOrganization;
  final String userId;

  const ElectionCard({
    Key? key,
    required this.id,
    required this.status,
    required this.electionTitle,
    required this.electionDescription,
    required this.electionOrganization,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // debugPrint('Container clicked!');
        context.go('/election-detail/$id/$userId');
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )),
                StatusTag(status: status),
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
                          context.go('/election-detail/$id/$userId/result');
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
