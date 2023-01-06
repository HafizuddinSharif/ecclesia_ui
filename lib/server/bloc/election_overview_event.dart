part of 'election_overview_bloc.dart';

abstract class ElectionOverviewEvent extends Equatable {
  const ElectionOverviewEvent();

  @override
  List<Object> get props => [];
}

class LoadElectionOverview extends ElectionOverviewEvent {
  final String id;

  const LoadElectionOverview({
    required this.id,
  });
}

class ChangeElectionOverview extends ElectionOverviewEvent {
  final Election election;
  final ElectionStatusEnum status;

  const ChangeElectionOverview({required this.election, required this.status});

  @override
  List<Object> get props => [election];
}
