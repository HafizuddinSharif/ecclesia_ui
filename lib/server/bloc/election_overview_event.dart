part of 'election_overview_bloc.dart';

abstract class ElectionOverviewEvent {
  const ElectionOverviewEvent();
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
}
