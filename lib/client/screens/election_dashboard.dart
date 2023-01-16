import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:ecclesia_ui/client/widgets/status_tag.dart';
import 'package:ecclesia_ui/client/widgets/status_tag_description.dart';
import 'package:ecclesia_ui/data/models/choice_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:ecclesia_ui/server/bloc/election_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ElectionDashboard extends StatelessWidget {
  final String id;

  const ElectionDashboard({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint("The id is $id");
    return BlocProvider.value(
      value: BlocProvider.of<ElectionOverviewBloc>(context)..add(LoadElectionOverview(id: id)),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 246, 248, 250),
          appBar: const CustomAppBar(
            back: true,
            disableBackGuard: true,
            disableMenu: false,
          ),
          endDrawer: const CustomDrawer(),
          bottomNavigationBar: BlocBuilder<ElectionOverviewBloc, ElectionOverviewState>(
            builder: (context, state) {
              if (state is ElectionOverviewInitial) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Start voting'),
                  ),
                );
              } else if (state is ElectionOverviewLoaded) {
                goVote() {
                  context.go('/election-detail/$id/voting');
                }

                if (state.status == ElectionStatusEnum.voteOpen || state.status == ElectionStatusEnum.voteEnding) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: goVote,
                      child: const Text('Start voting'),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(onPressed: null, child: Text('Start voting')),
                  );
                }
              } else {
                return const Text("Something is wrong =(");
              }
            },
          ),
          body: ListView(
            children: [
              BlocBuilder<ElectionOverviewBloc, ElectionOverviewState>(
                builder: (context, state) {
                  if (state is ElectionOverviewInitial) {
                    return const CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  } else if (state is ElectionOverviewLoaded) {
                    return ElectionStatus(
                      title: state.election.title,
                      description: state.election.description,
                      organization: state.election.organization,
                      status: state.status,
                      startTime: state.election.startTime,
                      endTime: state.election.endTime,
                      choices: state.election.choices,
                    );
                  } else {
                    return const Text('Something is wrong');
                  }
                },
              ),
              const ElectionDescription(),
              const VotingOptions(),
              BlocBuilder<ElectionOverviewBloc, ElectionOverviewState>(
                builder: (context, state) {
                  if (state is ElectionOverviewInitial) {
                    return const CircularProgressIndicator(color: Colors.blue);
                  } else if (state is ElectionOverviewLoaded) {
                    bool castedStatus = state.status == ElectionStatusEnum.voted || state.status == ElectionStatusEnum.voteClosed;
                    return castedStatus ? const VoteCasted() : const SizedBox();
                  } else {
                    return const Text('Something is wrong');
                  }
                },
              ),
            ],
          )),
    );
  }
}

class ElectionDescription extends StatelessWidget {
  const ElectionDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Election description',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'This is where the details of explaination of the objective of the election. Can also allow some sort of markdown functionality here so that the details can look nice and tidy',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class VoteCasted extends StatelessWidget {
  const VoteCasted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              'You voted for:',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          const VoteChoiceRow(title: 'Susan Matthew'),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              'Transaction ID:',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              labelText: 'xxxxxxxxxxxxxxxxxxxxxxx',
              suffixIcon: IconButton(
                  onPressed: () {
                    debugPrint('Not copied transaction id');
                  },
                  icon: const Icon(Icons.copy_rounded)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(width: 0, color: Colors.white),
              ),
              fillColor: const Color.fromARGB(255, 217, 217, 217),
              filled: true,
              suffixIconColor: const Color.fromARGB(255, 255, 255, 255),
              labelStyle: const TextStyle(color: Colors.black),
            )),
          ),
        ],
      ),
    );
  }
}

class VotingOptions extends StatelessWidget {
  const VotingOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              'Voting options',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          BlocBuilder<ElectionOverviewBloc, ElectionOverviewState>(
            builder: (context, state) {
              if (state is ElectionOverviewInitial) {
                return const CircularProgressIndicator(color: Colors.blue);
              } else if (state is ElectionOverviewLoaded) {
                Iterable<VoteChoiceRow> rows = state.election.choices.map(
                  (e) => VoteChoiceRow(title: e.title),
                );
                return Column(children: rows.toList(growable: false));
                // return Column(children: const [
                //   VoteChoiceRow(title: 'James Cameron'),
                //   VoteChoiceRow(title: 'Susan Matthew'),
                //   VoteChoiceRow(title: 'Yanning Li'),
                // ]);
              } else {
                return const Text('Something is wrong');
              }
            },
          )
        ],
      ),
    );
  }
}

class VoteChoiceRow extends StatelessWidget {
  final String title;

  const VoteChoiceRow({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
        width: 0.7,
        color: Colors.black,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
              onPressed: () {
                debugPrint('Open info about a choice');
              },
              icon: const Icon(Icons.info))
        ],
      ),
    );
  }
}

class ElectionStatus extends StatelessWidget {
  final String title;
  final String description;
  final String organization;
  final ElectionStatusEnum status;
  final DateTime startTime;
  final DateTime endTime;
  final List<Choice> choices;

  const ElectionStatus({
    Key? key,
    required this.title,
    required this.description,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.choices,
    required this.organization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 6)),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            organization,
            style: const TextStyle(fontSize: 12),
          ),
          Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          const SizedBox(
            height: 10,
          ),
          StatusTag(status: status),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_month),
              Text(
                '  Voting starts on ${DateFormat.yMd().format(startTime)}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          StatusTagDescription(status: status),
        ],
      ),
    );
  }
}
