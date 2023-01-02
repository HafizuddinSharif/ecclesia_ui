import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VotingCasted extends StatelessWidget {
  const VotingCasted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 248, 250),
      appBar: const CustomAppBar(
        back: false,
        disableBackGuard: true,
        disableMenu: false,
      ),
      endDrawer: const CustomDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/election-detail');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('Go back to election dashboard'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 6)),
            ]),
            child: const VoteConfirmation()),
      ),
    );
  }
}

class VoteConfirmation extends StatelessWidget {
  const VoteConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Center(child: Text('You chose:')),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Susan Matthew',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: 'Once you cast your vote, this action is ',
              children: [
                TextSpan(
                  text: 'irreversible',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: '.\n You can go back and '),
                TextSpan(
                  text: 'change',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: ' your choice '),
                TextSpan(
                  text: 'now',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
