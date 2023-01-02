import 'package:ecclesia_ui/data/models/election_card_model.dart';
import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:ecclesia_ui/client/widgets/election_card.dart';
import 'package:ecclesia_ui/server/bloc/joined_elections_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final List electionListDummy = [
    ElectionCardModel('Best cookie (Nov)', 'Description will be placed here', 'Edinburgh Baking Society', ElectionStatusEnum.voteOpen),
    ElectionCardModel('Social Meetup (Dec)', 'Description will be placed here', 'Edinburgh Baking Society', ElectionStatusEnum.voteNotOpen),
    ElectionCardModel('Quiz Night', 'Description will be placed here', 'Edinburgh Baking Society', ElectionStatusEnum.voteEnding),
    ElectionCardModel('Where to hike?', 'Description will be placed here', 'Edinburgh Baking Society', ElectionStatusEnum.voted),
  ];

  Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinedElectionsBloc()..add(LoadJoinedElection()),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 246, 248, 250),
          appBar: const CustomAppBar(back: false, disableBackGuard: false, disableMenu: false),
          endDrawer: const CustomDrawer(),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: const TextField(
                        decoration: InputDecoration(
                      labelText: 'Type here to search',
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide(width: 0, color: Colors.white),
                      ),
                      fillColor: Color.fromARGB(255, 217, 217, 217),
                      filled: true,
                      suffixIconColor: Color.fromARGB(255, 255, 255, 255),
                      labelStyle: TextStyle(color: Colors.black),
                    )),
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Just ended:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElectionCard(
                      electionTitle: 'Treasurer 22/23',
                      electionDescription: 'Description will be placed here. For this example, I am going to demonstrate what happen if the description test is long. If it populate more than 2 lines, it will be truncated.',
                      electionOrganization: 'Edinburgh University Sports Union (EUSU)',
                      status: ElectionStatusEnum.voteClosed),
                ]),
              ),
              Expanded(
                // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Active joined election(s):',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  BlocBuilder<JoinedElectionsBloc, JoinedElectionsState>(
                    builder: (context, state) {
                      if (state is JoinedElectionsInitial) {
                        return const CircularProgressIndicator(
                          color: Colors.blue,
                        );
                      } else if (state is JoinedElectionsLoaded) {
                        debugPrint('${state.elections.length}');
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: state.elections.length,
                            itemBuilder: (_, index) {
                              Election key = state.elections.keys.elementAt(index);
                              return ElectionCard(
                                electionTitle: key.title,
                                electionDescription: key.description,
                                electionOrganization: key.organization,
                                status: state.elections[key]!,
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('Something is wrong');
                      }
                    },
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
