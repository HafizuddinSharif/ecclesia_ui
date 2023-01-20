import 'package:ecclesia_ui/data/models/choice_model.dart';
import 'package:equatable/equatable.dart';

class Election extends Equatable {
  final String id;
  final String title;
  final String description;
  final String organization;
  final DateTime startTime;
  final DateTime endTime;
  final List<Choice> choices;

  const Election({required this.id, required this.title, required this.description, required this.organization, required this.startTime, required this.endTime, required this.choices});

  @override
  List<Object?> get props => [id, title];

  // Dummy data for election
  static List<Election> elections = [
    Election(
      id: '0',
      title: 'Treasurer 22/23',
      description: 'This is for the description of the election. It can be long if needed',
      organization: 'Edinburgh University Sports Union (EUSU)',
      startTime: DateTime.parse("2022-02-23"),
      endTime: DateTime.parse("2022-03-23"),
      choices: Choice.personChoice,
    ),
    Election(
      id: '1',
      title: 'Best food (April)',
      description: 'This is for the description of the election. It can be long if needed',
      organization: 'Edinburgh Baking Society',
      startTime: DateTime.parse("2022-04-10"),
      endTime: DateTime.parse("2022-04-23"),
      choices: Choice.foodChoice,
    ),
    Election(
      id: '2',
      title: 'Social Meetup for the first time in a while (Dec)',
      description: 'This is for the description of the election. It can be long if needed',
      organization: 'Informatics 19/23',
      startTime: DateTime.parse("2022-04-15"),
      endTime: DateTime.parse("2022-04-25"),
      choices: Choice.personChoice,
    ),
    Election(
      id: '3',
      title: 'Christmas carol',
      description: 'This is for the description of the election. It can be long if needed',
      organization: 'Informatics 19/23',
      startTime: DateTime.parse("2022-04-15"),
      endTime: DateTime.parse("2022-04-25"),
      choices: Choice.personChoice,
    ),
    Election(
      id: '4',
      title: 'Club socials',
      description: 'This is for the description of the election. It can be long if needed.',
      organization: 'Edinburgh Baking Society',
      startTime: DateTime.parse("2023-02-15"),
      endTime: DateTime.parse("2023-02-25"),
      choices: Choice.pubChoice,
    )
  ];
}
