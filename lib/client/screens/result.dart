import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String id;
  final String userId;

  const Result({Key? key, required this.id, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 248, 250),
      appBar: CustomAppBar(
        back: true,
        disableBackGuard: true,
        disableMenu: false,
      ),
      endDrawer: CustomDrawer(),
      body: Center(
        child: Text('This is the result page'),
      ),
    );
  }
}
