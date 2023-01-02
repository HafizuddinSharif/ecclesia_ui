part of 'joined_elections_bloc.dart';

@immutable
abstract class JoinedElectionsState extends Equatable {
  const JoinedElectionsState();

  @override
  List<Object?> get props => [];
}

class JoinedElectionsInitial extends JoinedElectionsState {}

class JoinedElectionsLoaded extends JoinedElectionsState {
  final Map<Election, ElectionStatusEnum> elections;

  const JoinedElectionsLoaded({required this.elections});

  @override
  List<Object> get props => [elections];
}
