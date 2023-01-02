import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class PastElections extends StatelessWidget {
  const PastElections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(back: true, disableBackGuard: false, disableMenu: false),
        endDrawer: CustomDrawer(),
        body: Center(
          child: Text('This is past elections page!'),
        ));
  }
}
