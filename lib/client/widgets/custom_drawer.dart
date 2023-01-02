import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Go back home'),
            onTap: () {
              context.go('/');
              Scaffold.of(context).closeEndDrawer();
            },
          ),
          ListTile(
            title: const Text('Register to an organization'),
            onTap: () {
              context.go('/register-organization');
              Scaffold.of(context).closeEndDrawer();
            },
          ),
          ListTile(
            title: const Text('Register to an election'),
            onTap: () {
              context.go('/register-organization');
              Scaffold.of(context).closeEndDrawer();
            },
          ),
          ListTile(
            title: const Text('View past joined election(s)'),
            onTap: () {
              context.go('/past-elections');
              Scaffold.of(context).closeEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
