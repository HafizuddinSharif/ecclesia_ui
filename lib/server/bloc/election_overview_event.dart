part of 'election_overview_bloc.dart';

abstract class ElectionOverviewEvent extends Equatable {
  const ElectionOverviewEvent();

  @override
  List<Object> get props => [];
}

class LoadElectionOverview extends ElectionOverviewEvent {}
