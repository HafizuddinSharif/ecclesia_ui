import 'package:bloc/bloc.dart';
import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:ecclesia_ui/data/models/voter_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'joined_elections_event.dart';
part 'joined_elections_state.dart';

class JoinedElectionsBloc extends Bloc<JoinedElectionsEvent, JoinedElectionsState> {
  JoinedElectionsBloc() : super(JoinedElectionsInitial()) {
    on<LoadJoinedElection>(
      (event, emit) async {
        await Future<void>.delayed(const Duration(seconds: 5));
        emit(JoinedElectionsLoaded(elections: Voter.voters[0].joinedElections));
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
