import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:ecclesia_ui/server/bloc/election_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ElectionDashboard extends StatelessWidget {
  const ElectionDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectionOverviewBloc()..add(LoadElectionOverview()),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 246, 248, 250),
          appBar: const CustomAppBar(
            back: true,
            disableBackGuard: true,
            disableMenu: false,
          ),
          endDrawer: const CustomDrawer(),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  context.go('/election-detail/voting');
                },
                child: const Text('Start voting')),
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
                    return ElectionStatus(title: state.election.title);
                  } else {
                    return const Text('Something is wrong');
                  }
                },
              ),
              const VotingOptions(),
              const VoteCasted(),
              const ElectionDescription(),
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
          Column(children: const [
            VoteChoiceRow(title: 'James Cameron'),
            VoteChoiceRow(title: 'Susan Matthew'),
            VoteChoiceRow(title: 'Yanning Li'),
          ])
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

  const ElectionStatus({
    Key? key,
    required this.title,
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
        children: [
          const Text(
            'Edinburgh Baking Society',
            style: TextStyle(fontSize: 12),
          ),
          Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: const Text('Setting up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.calendar_month),
              Text(
                '  Voting starts on 24/02/2023',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.dangerous_rounded,
                  size: 80,
                  color: Colors.red,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('You have not voted yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    Text('Wait for the election to open.'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
