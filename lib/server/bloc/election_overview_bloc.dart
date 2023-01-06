import 'package:bloc/bloc.dart';
import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:ecclesia_ui/data/models/voter_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'election_overview_event.dart';
part 'election_overview_state.dart';

class ElectionOverviewBloc extends Bloc<ElectionOverviewEvent, ElectionOverviewState> {
  ElectionOverviewBloc() : super(ElectionOverviewInitial()) {
    on<LoadElectionOverview>((event, emit) {
      // await Future<void>.delayed(const Duration(seconds: 2));
      int id = int.parse(event.id);
      Election election = Election.elections[id];
      ElectionStatusEnum status = Voter.voters[0].joinedElections[election]!;
      emit(ElectionOverviewLoaded(election: election, status: status, id: event.id));
    });
    on<ChangeElectionOverview>(((event, emit) {
      if (state is ElectionOverviewLoaded) {
        // final state = this.state as ElectionOverviewLoaded;
        emit(ElectionOverviewLoaded(election: event.election, status: event.status, id: event.election.id));
      }
    }));
  }
}
