part of 'election_overview_bloc.dart';

abstract class ElectionOverviewState extends Equatable {
  const ElectionOverviewState();

  @override
  List<Object> get props => [];
}

class ElectionOverviewInitial extends ElectionOverviewState {}

class ElectionOverviewLoaded extends ElectionOverviewState {
  final Election election;
  final ElectionStatusEnum status;

  const ElectionOverviewLoaded({required this.election, required this.status});

  @override
  List<Object> get props => [election];
}
