import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final String id;
  final String title;
  final String description;
  final int numberOfVote;

  const Choice({
    required this.id,
    required this.title,
    required this.description,
    required this.numberOfVote,
  });

  @override
  List<Object?> get props => [id];

  static List<Choice> personChoice = [
    const Choice(id: '0', title: 'James Cameron', description: 'This is the description for my boi James Cameron.', numberOfVote: 0),
    const Choice(id: '1', title: 'Susan Matthew', description: 'Susan just moved in from the states.', numberOfVote: 0),
    const Choice(id: '2', title: 'Yanning Li', description: 'Yanning always wanted to fly an airplane when she was a child.', numberOfVote: 0),
  ];

  static List<Choice> foodChoice = [
    const Choice(id: '0', title: 'Pizza', description: 'Good old italian dish.', numberOfVote: 0),
    const Choice(id: '1', title: 'Fish and chips', description: 'Originated from the Brits.', numberOfVote: 0),
    const Choice(id: '2', title: 'Tikka Masala', description: 'An indian dish, but actually from the UK.', numberOfVote: 0),
  ];
}
