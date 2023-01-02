import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:ecclesia_ui/client/widgets/custom_radio_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Voting extends StatefulWidget {
  const Voting({Key? key}) : super(key: key);

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  bool hasChosen = false;
  int _chosenOptions = 0;

  void changeSelection(value) {
    setState(() {
      _chosenOptions = value;
    });
  }

  void chooseSelection() {
    if (_chosenOptions != 0) {
      setState(() {
        hasChosen = true;
      });
    }
  }

  void removeSelection() {
    setState(() {
      hasChosen = false;
      _chosenOptions = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 248, 250),
      appBar: const CustomAppBar(
        back: true,
        disableBackGuard: false,
        disableMenu: true,
      ),
      endDrawer: const CustomDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Visibility(
              visible: hasChosen ? true : false,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement confirm ballot cast
                  context.go('/election-detail/voting/voting-casted');
                  debugPrint('Confirm ballot!');
                },
                child: const Text('I cast my vote!'),
              ),
            ),
            _chosenOptions == 0
                ? const DisabledButton()
                : ElevatedButton(
                    onPressed: hasChosen ? removeSelection : chooseSelection,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(hasChosen ? Colors.black : Colors.blue),
                    ),
                    child: Text(hasChosen ? 'No, I change my mind' : 'I choose this'),
                  ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 6)),
          ]),
          child: hasChosen
              ? const VoteConfirmation()
              : VotingPicker(
                  chosenOption: _chosenOptions,
                  changeSelection: changeSelection,
                ),
        ),
      ),
    );
  }
}

class DisabledButton extends StatelessWidget {
  const DisabledButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
      child: const Text(
        'I choose this',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class VoteConfirmation extends StatelessWidget {
  const VoteConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Center(child: Text('You chose:')),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              'Susan Matthew',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ),
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: 'Once you cast your vote, this action is ',
              children: [
                TextSpan(
                  text: 'irreversible',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: '.\n You can go back and '),
                TextSpan(
                  text: 'change',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: ' your choice '),
                TextSpan(
                  text: 'now',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VotingPicker extends StatelessWidget {
  final int chosenOption;
  final Function changeSelection;

  const VotingPicker({
    required this.chosenOption,
    required this.changeSelection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(children: const [
            Text('Select your choice to vote for:'),
            Text(
              'President 22/23',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ]),
        ),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              CustomRadioListTile<int>(
                value: 1,
                groupValue: chosenOption,
                leading: Icons.close,
                title: const Text(
                  'James Cameron',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                onChanged: (value) {
                  changeSelection(value);
                },
              ),
              CustomRadioListTile<int>(
                value: 2,
                groupValue: chosenOption,
                leading: Icons.close,
                title: const Text(
                  'Susan Matthew',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                onChanged: (value) {
                  changeSelection(value);
                },
              ),
              CustomRadioListTile<int>(
                value: 3,
                groupValue: chosenOption,
                leading: Icons.close,
                title: const Text(
                  'Yanning Li',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                onChanged: (value) {
                  changeSelection(value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
