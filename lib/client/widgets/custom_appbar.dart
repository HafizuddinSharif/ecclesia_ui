import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final bool back;
  final bool disableMenu;
  final bool disableBackGuard;

  const CustomAppBar({
    required this.back,
    required this.disableMenu,
    required this.disableBackGuard,
    Key? key,
  })  : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Ecclesia UI',
        style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      toolbarHeight: 100,
      leadingWidth: 100,
      shadowColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3), //color of shadow
      // spreadRadius: 0, //spread radius
      // blurRadius: 50, // blur radius
      // offset: const Offset(0, 4)),,
      automaticallyImplyLeading: false,
      leading: back
          ? InkWell(
              onTap: () {
                if (disableBackGuard == false) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Changes will not be saved.'),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                              context.pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  context.pop();
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      centerTitle: true,
      actions: [
        disableMenu
            ? Container()
            : InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                  debugPrint('Menu open!');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
      ],
    );
  }
}
