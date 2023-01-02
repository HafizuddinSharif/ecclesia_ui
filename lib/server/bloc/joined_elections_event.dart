part of 'joined_elections_bloc.dart';

abstract class JoinedElectionsEvent extends Equatable {
  const JoinedElectionsEvent();

  @override
  List<Object> get props => [];
}

class LoadJoinedElection extends JoinedElectionsEvent {}

// class AddJoinedElection extends JoinedElectionsEvent {
//   final Election election;

//   const AddJoinedElection(this.election);

//   @override
//   List<Object> get props => [election];
// }

// class RemoveJoinedElection extends JoinedElectionsEvent {
//   final Election election;

//   const RemoveJoinedElection(this.election);

//   @override
//   List<Object> get props => [election];
// }
