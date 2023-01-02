import 'package:ecclesia_ui/data/models/election_model.dart';
import 'package:ecclesia_ui/data/models/election_overview_model.dart';
import 'package:equatable/equatable.dart';

class Voter extends Equatable {
  final String id;
  final String name;
  final String publicKey;
  final Map<Election, ElectionStatusEnum> joinedElections;

  const Voter({
    required this.id,
    required this.name,
    required this.publicKey,
    required this.joinedElections,
  });

  @override
  List<Object?> get props => [id, publicKey];

  //Dummy data for voter data
  static List<Voter> voters = [
    Voter(
      id: '0',
      name: 'Jackie Chan',
      publicKey: 'hwfi32932jf0',
      joinedElections: {
        Election.elections[0]: ElectionStatusEnum.voteNotOpen,
        Election.elections[1]: ElectionStatusEnum.voteOpen,
      },
    ),
    Voter(
      id: '1',
      name: 'Harry Kane',
      publicKey: 'hwfig2932jf0',
      joinedElections: {
        Election.elections[0]: ElectionStatusEnum.voted,
        Election.elections[1]: ElectionStatusEnum.voteEnding,
        Election.elections[2]: ElectionStatusEnum.registeringDetails,
      },
    ),
  ];
}
