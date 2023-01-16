import 'package:bloc/bloc.dart';
import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:ecclesia_ui/data/models/voter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'joined_elections_event.dart';
part 'joined_elections_state.dart';

class JoinedElectionsBloc extends Bloc<JoinedElectionsEvent, JoinedElectionsState> {
  JoinedElectionsBloc() : super(JoinedElectionsInitial()) {
    on<LoadJoinedElection>(
      (event, emit) async {
        var user = int.parse(event.user.id); // To change the user of the app, just change the index value of the voter here.
        if (state is JoinedElectionsLoaded) {
          print("Happen here");
          final state = this.state as JoinedElectionsLoaded;
          emit(JoinedElectionsLoaded(elections: state.elections));
        } else {
          print("Still here");
          await Future<void>.delayed(const Duration(seconds: 2));
          emit(JoinedElectionsLoaded(elections: Voter.voters[user].joinedElections));
        }
      },
    );
    on<UpdateStatusJoinedElection>(
      (event, emit) {
        print("Yeett");
        if (state is JoinedElectionsLoaded) {
          final state = this.state as JoinedElectionsLoaded;
          state.elections[event.election] = event.status;
          print(event.election.title);
          emit(
            JoinedElectionsLoaded(
              elections: state.elections,
            ),
          );
        }
      },
    );
    // on<AddJoinedElection>(
    //   (event, emit) {
    //     if (state is JoinedElectionsLoaded) {
    //       final state = this.state as JoinedElectionsLoaded;
    //       emit(
    //         JoinedElectionsLoaded(
    //           elections: List.from(state.elections)..add(event.election),
    //         ),
    //       );
    //     }
    //   },
    // );
    // on<RemoveJoinedElection>(
    //   (event, emit) {
    //     if (state is JoinedElectionsLoaded) {
    //       final state = this.state as JoinedElectionsLoaded;
    //       emit(
    //         JoinedElectionsLoaded(
    //           elections: List.from(state.elections)..remove(event.election),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
