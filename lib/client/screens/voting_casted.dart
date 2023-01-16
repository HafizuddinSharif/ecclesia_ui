import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:ecclesia_ui/data/models/choice_model.dart';
import 'package:ecclesia_ui/server/bloc/picked_choice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VotingCasted extends StatelessWidget {
  final String id;
  final String userId;

  const VotingCasted({Key? key, required this.id, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PickedChoiceBloc>(context),
      child: Scaffold(
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
                  context.go('/election-detail/$id/$userId');
                  // debugPrint("Going to election detail with id ");
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
              child: BlocBuilder<PickedChoiceBloc, PickedChoiceState>(
                builder: (context, state) {
                  if (state is PickedChoiceInitial) {
                    return const CircularProgressIndicator(color: Colors.blue);
                  } else if (state is PickedChoiceLoaded) {
                    return VoteConfirmation(choice: state.choice);
                  } else {
                    return const Text("Something is wrong.");
                  }
                },
              )),
        ),
      ),
    );
  }
}

class VoteConfirmation extends StatelessWidget {
  final Choice choice;
  const VoteConfirmation({
    required this.choice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(child: Text('You chose:')),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              choice.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            "Thank you for voting in this election. Currently processing your ballot.",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
