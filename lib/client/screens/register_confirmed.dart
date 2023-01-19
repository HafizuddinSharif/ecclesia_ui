import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterConfirmed extends StatelessWidget {
  final bool isElection;
  const RegisterConfirmed({Key? key, required this.isElection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(back: false, disableBackGuard: true, disableMenu: false),
      endDrawer: const CustomDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/');
                // debugPrint("Going to election detail with id ");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text('Go back home'),
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
          child: isElection ? const JoinElectionPending() : const JoinOrganizationConfirmed(),
        ),
      ),
    );
  }
}

class JoinOrganizationConfirmed extends StatelessWidget {
  const JoinOrganizationConfirmed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle,
          size: 80,
          color: Colors.green,
        ),
        const SizedBox(height: 10),
        const Text(
          'Your current status on joining',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Edinburgh University Students\' Association (EUSA)',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: const Text('Successful!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              )),
        ),
        const SizedBox(height: 10),
        const Text(
          'You are now eligible to join election(s) by this organization.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class JoinElectionPending extends StatelessWidget {
  const JoinElectionPending({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.av_timer_rounded,
          size: 80,
          color: Colors.orange,
        ),
        const SizedBox(height: 10),
        const Text(
          'Your current status on joining the election:',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Edinburgh Baking Society',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        const Text(
          'Club Social',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: const Text('Registering your details',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              )),
        ),
        const SizedBox(height: 10),
        const Text(
          'We will send you an email to notify if you have been successfully registered',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
