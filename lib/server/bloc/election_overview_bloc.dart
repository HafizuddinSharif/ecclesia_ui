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
    on<LoadElectionOverview>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 2));
      Election election = Voter.voters[0].joinedElections.keys.toList(growable: false)[1];
      ElectionStatusEnum status = Voter.voters[0].joinedElections[election]!;
      emit(ElectionOverviewLoaded(election: election, status: status));
    });
  }
}
